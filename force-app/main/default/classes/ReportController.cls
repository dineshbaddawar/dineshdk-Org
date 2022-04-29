public with sharing class ReportController {

    @AuraEnabled(cacheable=true)
    public static Decimal getInFlightOpportunitiesCnt(){
        Map<String, Report> reportMap = getReports();
        return ReportLogic.getCnt(
            reportMap.get('InFlightOpportunities').Id
        );
    }

    @AuraEnabled(cacheable=true)
    public static String getReportURLInFlightOpps() {
        Map<String, Report> reportMap = getReports();
        return ReportLogic.getURL(
            reportMap.get('InFlightOpportunities').Id
        );
    }

    @AuraEnabled(cacheable=true)
    public static Map<String,Report> getReports() {
        Map<String, Report> reportMap = new Map<String, Report>();
        List<Report> reportLst = new List<Report>([
            SELECT 
                Id,
                DeveloperName 
            FROM Report 
            WHERE DeveloperName IN ( 
                'InFlightOpportunities'
            )
        ]);
        if (!reportLst.isEmpty()) {
            for (Report each: reportLst) {
                reportMap.put(each.DeveloperName,each);
            }
        }
        return reportMap;
    }

}