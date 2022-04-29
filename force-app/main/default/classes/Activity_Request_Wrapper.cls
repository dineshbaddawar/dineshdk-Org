global class Activity_Request_Wrapper {

    public cls_activity[] Activity;
    global class cls_activity{
        public String activity_type;
        public String search_by_value;
        public String exam_date;
        public String activity_note;
        public String exam_name;
        public String exam_slug;
        public String subject;
        public String exam_score;
        public String skill_based_exam_score;
        public Boolean is_qualified_in_exam;
    }
    
    public static Activity_Request_Wrapper parse(String json){
        return (Activity_Request_Wrapper)System.JSON.deserialize(json,Activity_Request_Wrapper.class);
    }
}