public class Linkedin_Example {

    public String clientId        {set;get;}
    public String clientSecret    {set;get;}
    public String redirectUrl     {set;get;}
    public String code            {set;get;}
    public String accessToken     {set;get;}
    public String state           {set;get;}
    
    public Linkedin_Example(){
        redirectUrl = 'https%3A%2F%2Fd2w000001e8lgeay-dev-ed.lightning.force.com';
        
    }
    
    public PageReference requestCode(){
        String url = 'https://www.linkedin.com/oauth/v2/authorization';
        url = url+'?response_type=code';
        url = url+'&client_id='+clientId;
        url = url+'&redirect_url='+redirectUrl;
        url = url+'&state='+state;
        PageReference p = new PageReference(url);
        return p;
    }
}