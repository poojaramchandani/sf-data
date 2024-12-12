public class AccountEMailTriggerHandler {
	public static void checkEmailDuplicacy(List <Account> newAcc)
    {
        Set <String> mail = new Set<String>();
        Set <Account> acc = new Set<Account> ([Select  Email__c  from Account ]);
        for(Account acc2 : acc)
        {
			mail.add(acc2.Email__c);
        }
        for(Account check : newAcc)
       	{
			if(mail.contains(check.Email__c))
            {
                check.Email__c.addError('Already Exist You cant Add Duplicate Email');
            }
        }
            
    }
}