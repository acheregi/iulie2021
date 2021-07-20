/**
 * Created by fabiankramer on 26.05.21.
 */

//@IsTest
public with sharing class persistent329Test {

    //@TestSetup
    public static void insertAccount(){

        delete [SELECT Id FROM Account WHERE Name LIKE 'Dummy Account - %' LIMIT 100];

        List<Account> accountList = new List<Account>();

        Account a1 =  new Account(
                Name = 'Dummy Account - Case 100',
                CL_AccountIDInSF2__c = '0011r00002EdYJ0AAN',
                CL_Firmenstatus__c = 'Debitor Kunde',
                CL_CS1InBearbeitung__c = false, // wegen Validierungsregel LKM_AlleVierVGFelder
                CL_CS2InBearbeitung__c = false, // wegen Validierungsregel  LKM_AlleVierVGFelder
                CL_ZurBearbeitungGesperrt__c = false,
                ShippingPostalCode = '74321',
                ShippingCity = 'test',
                BillingCity = 'test',
                BillingPostalCode = '74321',
                BillingStateCode = 'BW',
                BillingCountry = 'Deutschland',
                LKM_EmailZentrale__c = 'fabian.kramer@fk-sd.de',
                Phone = '+491754101967',
                RecordTypeId = '0121r000000BYKgAAO',
                CL_GeplAuftragsvolumenVG1__c = 999999,
                CL_DrucksteuerungSMVBelegeVG1__c = 'ohne Gültigkeit',
                CL_VertriebsgesellschaftVG1__c = 'Ambient-TV Sales & Servic',
                CL_ZahlungskonditionenVG1__c = '14 Tage ab Re.dat. 2% Skto., 45 Tage ohne Abzug',
                Type = 'Werbungtreibender',
                LKM_IndustryOberbranche__c = 'Dienstleistung',
                LKM_IndustryUnterbranche__c = 'Dienstleistung Sonstige',
                CL_Antrag_CS2__c = 'Neu',
                CL_GecleartCS2__c = null
                //CL_HelperDebitorenNeuAnlageausSF2__c =true
        );

        Account a2 =  new Account(
                Name = 'Dummy Account - Case 200',
                CL_AccountIDInSF2__c = '0011r00002EdYJ0AAN',
                CL_Firmenstatus__c = 'Debitor Kunde',
                CL_CS1InBearbeitung__c = false, // wegen Validierungsregel LKM_AlleVierVGFelder
                CL_CS2InBearbeitung__c = true, // wegen Validierungsregel  LKM_AlleVierVGFelder
                CL_ZurBearbeitungGesperrt__c = false,
                ShippingPostalCode = '74321',
                ShippingCity = 'test',
                BillingCity = 'test',
                BillingPostalCode = '74321',
                BillingStateCode = 'BW',
                BillingCountry = 'Deutschland',
                LKM_EmailZentrale__c = 'fabian.kramer@fk-sd.de',
                Phone = '+491754101967',
                RecordTypeId = '0121r000000BYKgAAO',
                CL_GeplAuftragsvolumenVG1__c = 999999,
                CL_DrucksteuerungSMVBelegeVG1__c = 'ohne Gültigkeit',
                CL_VertriebsgesellschaftVG1__c = 'Ambient-TV Sales & Servic',
                CL_ZahlungskonditionenVG1__c = '14 Tage ab Re.dat. 2% Skto., 45 Tage ohne Abzug',
                Type = 'Werbungtreibender',
                LKM_IndustryOberbranche__c = 'Dienstleistung',
                LKM_IndustryUnterbranche__c = 'Dienstleistung Sonstige',
                CL_Antrag_CS2__c = 'Neu',
                CL_GecleartCS2__c = null,
                CL_EMail__c = 'fabian_kramer@persistent.com',
                CL_HelperEmailangefordertVon__c = 'fabian_kramer@persistent.com'
                //CL_HelperDebitorenNeuAnlageausSF2__c =true
        );

        accountList.add(a1);
        accountList.add(a2);
        insert accountList;

    }

    //@IsTest
    public static void updateAccount1(){
        Account acc = [SELECT Id  FROM Account WHERE Name = 'Dummy Account - Case 100' LIMIT 1][0];
        //Test.startTest();
        acc.CL_GecleartCS2__c = System.Today();
        acc.CL_Antrag_CS2__c = 'Ändern';
        update acc;
        //Test.startTest();
    }

    //@IsTest
    public static void updateAccount2(){
        Account acc = [SELECT Id  FROM Account WHERE Name = 'Dummy Account - Case 200' LIMIT 1][0];
        //Test.startTest();
        acc.CL_Antrag_CS2__c = 'Ändern';
        acc.CL_AbgelehnteNeuanlageCS1CS2__c = true;
        update acc;
        //Test.startTest();
    }


}