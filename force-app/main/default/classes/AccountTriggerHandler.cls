public class AccountTriggerHandler {
	public static void createContactOnAccount(List<Account> newAcc)
    {
        List<Contact> con = new List<Contact>();
        for(Account acc : newAcc)
        {
            Integer count = Integer.valueOf(acc.Number_of_Contacts__c);
            if(count<=5)
            {
            	for(Integer i=1; i<=count; i++ )
            	{
               		Contact c = new Contact();
              		c.LastName = acc.Name+' '+i;
                	c.AccountId = acc.Id;
                	con.add(c);
            	}
        	}
            else if(count>5)
            {
                acc.Number_of_Contacts__c.addError('You cannot add contacts greater than 5');
            }    
   		 }
        if(con.size()>0)
        {
        	insert con;
        }
    }  
}