<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>reimbursement_email_to_be_fired_when_a_new_record_is_created_in_Expense_Member_o</fullName>
        <description>reimbursement email to be fired when a new record is created in Expense Member object</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Reimbursement_pdf</template>
    </alerts>
    <alerts>
        <fullName>send_email_as_soon_as_a_record_is_created_in_Expense_Member_object</fullName>
        <description>send email as soon as a record is created in Expense Member object</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Reimbursement</template>
    </alerts>
    <fieldUpdates>
        <fullName>Field_update_email</fullName>
        <field>Email__c</field>
        <name>Field update email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>copy_email</fullName>
        <field>Email__c</field>
        <formula>Member__r.Email__c</formula>
        <name>copy email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Invoice mail generation when contributed amount %3E 0</fullName>
        <actions>
            <name>reimbursement_email_to_be_fired_when_a_new_record_is_created_in_Expense_Member_o</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Expense_Member__c.Name</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <criteriaItems>
            <field>Expense_Member__c.Contribution_Amount_INR__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>populate email field</fullName>
        <actions>
            <name>copy_email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Expense_Member__c.Name</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <description>auto-populate email field in Expense Members object</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
