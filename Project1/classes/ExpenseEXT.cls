public with sharing class ExpenseEXT                                                                                        // class declaration
{
    public Expense__c expObj{get;set;}                                                                                      // object of Expense_c type
    public List<Expense_Member__c> memExp{get;set;}                                                                         // object of array-list return type

    public ExpenseEXT(ApexPages.StandardController controller)                                                              // class constructor
    {
        expObj = (Expense__c)controller.getRecord();                                                                   
        memExp = getExpMembers();
    }
    
    public List<Expense_Member__c> getExpMembers()                                                                          // returns list records of Expense_Members oject                                    
    {
        return [Select Member__r.Name, Contribution_Amount_INR__c from Expense_Member__c where Expense__c =: expObj.Id];
    }
}