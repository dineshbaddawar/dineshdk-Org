public with sharing class ReportLogic {
    public static String getURL( ID reportId ) {
        Reports.ReportDescribeResult describe = 
            Reports.ReportManager.describeReport(reportId);
        Reports.ReportMetadata reportMd = describe.getReportMetadata();
        String reportURL = '/lightning/r/Report/' + reportMd.getId();
        return reportURL;    
    }
  
    public static Decimal getCnt( ID reportId ) {
        Reports.ReportDescribeResult describe = 
            Reports.ReportManager.describeReport(reportId);
        Reports.ReportMetadata reportMd = describe.getReportMetadata();
        Reports.ReportResults results = 
            Reports.ReportManager.runReport(reportId, reportMd);
        // get report summary details     
        Reports.ReportFactWithSummaries factDetails =
            (Reports.ReportFactWithSummaries) results.getFactMap().get('T!T');
        List<Reports.SummaryValue> summary = factDetails.getAggregates();
        // summary[0] is the first group by field in the report 
        // use summary[1], summary[2] etc. for the other group by fields in the report
        Decimal cnt = (Decimal)summary[0].getValue()>0 ? (Decimal)summary[0].getValue():0;
        return cnt;
    }
}