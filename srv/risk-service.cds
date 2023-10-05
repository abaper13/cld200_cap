using {riskmanagement as rm} from '../db/schema';

 /**
   * For serving end users
   */
 service RiskService @(path : 'service/risk') {
 //### BEGIN OF DELETE
 //  entity Risks as projection on rm.Risks;
 //### END OF DELETE
 //### BEGIN OF INSERT
   entity Risks @(restrict : [
       {
          grant : [ 'READ' ],
          to : [ 'RiskViewer' ]
       },
       {
           grant : [ '*' ],
           to : [ 'RiskManager' ]
       }
   ]) as projection on rm.Risks;
 //### END OF INSERT
   annotate Risks with @odata.draft.enabled;
 //### BEGIN OF DELETE
 //  entity Mitigations as projection on rm.Mitigations;
 //### END OF DELETE
 //### BEGIN OF INSERT
   entity Mitigations @(restrict : [
       {
         grant : [ 'READ' ],
         to : [ 'RiskViewer' ]
       },
       {
         grant : [ '*' ],
         to : [ 'RiskManager' ]
       }
   ]) as projection on rm.Mitigations;
 //### END OF INSERT
     annotate Mitigations with @odata.draft.enabled;
   @readonly entity BusinessPartners as projection on rm.BusinessPartners;
 }