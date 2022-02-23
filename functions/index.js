const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions

exports.processMatchingCommissions = functions.https.onRequest(async (request, response) => {
  const uhcRef=admin.firestore().collection("userHierarchies");
  const uhRefs= await uhcRef.where("hasReferral", "==", false).get();
  var uh;
  uhRefs.forEach(uhData => {
    uh=uhData.data();
  });
  let mb= await processCommission(uh.hierarchyUser);

  response.json({result: `Commission Processed Successfully`});
});

async function processCommission(userRef) {
  var uh= await getHierarchy(userRef);
  var lb=0,rb=0,ub=0,mb=0;
  if(uh.hasLeft) {
	  lb= await processCommission(uh.leftChildRef);
  }
  if(uh.hasRight) {
	  rb= await processCommission(uh.rightChildRef);
  }
  let res;
  if(lb>0 && rb>0) {
	  if(lb>rb) {
		  mb= rb;
		  res= await setCalculations(uh.leftChildRef,lb-mb,undefined);
		  if(rb>0) {
			 res= await setCalculations(uh.rightChildRef,0,undefined);
		  }
	  }
	  if(rb>lb) {
		  mb= lb;
		  res= await setCalculations(uh.rightChildRef,rb-mb,undefined);
		  if(lb>0) {
			 res= await setCalculations(uh.leftChildRef,0,undefined);
		  }
	  }
  }
  var ub= await getCalculations(userRef);
  if(mb>0) {
	res= await processUserCommission(userRef,mb,ub);
  }
  return ub + mb;
}

async function processUserCommission(userRef,mb,ub) {
  let per= await getCommPercentage();
  let comVal= (mb*per)/100;
  let res= await setCommissions(userRef,comVal,mb);
  let fub= ub + mb;
  res= await setCalculations(userRef,fub,comVal);
  return res;
}

async function getHierarchy(userRef) {
  const uhcRef=admin.firestore().collection("userHierarchies");
  const uhRefs= await uhcRef.where("hierarchyUser", "==", userRef).get();
  let uh;
  uhRefs.forEach(uhData => {
    uh=uhData.data();
  });
  return uh;
}

async function getCalculations(userRef) {
  const calRefs=await admin.firestore().collection("calculations").where("userRef", "==", userRef).get();
  let calData;
  calRefs.forEach(doc => {
    calData=doc.data();
  });
  return calData.unPBusinessAmt;
}

async function setCalculations(userRef,bVal,cVal) {
  const calRefs=await admin.firestore().collection("calculations").where("userRef", "==", userRef).get();
  let calDoc;
  calRefs.forEach(doc => {
    calDoc=doc;
  });
  let res;
  if(bVal!=undefined && cVal!=undefined) {
	  let uCVal= cVal + calDoc.data().indirectCommission;
	  res= await calDoc.ref.update({
		  unPBusinessAmt: bVal ,
		  indirectCommission: uCVal
	  });
  } else if(bVal!=undefined) {
	  res= await calDoc.ref.update({
		  unPBusinessAmt: bVal
	  });
  } else {
	  let uCVal= cVal + calDoc.data().indirectCommission;
	  res= await calDoc.ref.update({
		  indirectCommission: uCVal
	  });
  }
  return res;
}

async function setCommissions(userRef,comVal,mb) {
  const comRef=await admin.firestore().collection("commissions").where("commissionUser", "==", userRef).where("isDirect", "==", false).get();
  let comDoc;
  comRef.forEach(doc => {
    comDoc=doc;
  });
  let sComVal= comVal+comDoc.data().commissionAmount;
  let sUComVal= comVal+comDoc.data().unsettledAmount;
  let lmDate= admin.firestore.Timestamp.now();
  let comment= "Commission of amount "+sComVal+" processed for business of amount "+mb+" at "+ new Date();
  const res= await comDoc.ref.update({
	  commissionAmount: sComVal ,
	  unsettledAmount: sUComVal ,
	  settled: false,
	  comments: admin.firestore.FieldValue.arrayUnion(comment),
	  lastModified: lmDate
  });
  return res;
}

async function getCommPercentage() {
  const accRef=await admin.firestore().collection("adminConsts");
  const acRefs= await accRef.where("docCode", "==", "SBAdmin").get();
  let ac;
  acRefs.forEach(acData => {
    ac=acData.data();
  });
  return ac.indirectPer;
}
