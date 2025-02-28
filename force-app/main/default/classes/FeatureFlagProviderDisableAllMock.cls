
public with sharing class FeatureFlagProviderDisableAllMock implements IFeatureFlagProvider {
    
    public Set<String> getCustomPermissionNames(){
        Set<String> customPermissionNames = new Set<String>();
        customPermissionNames.add('permission1');
        customPermissionNames.add('permission2');
        return customPermissionNames;
    }

    public Map<String,FeatureFlag__mdt> getFeatureFlags(){
        Map<String,FeatureFlag__mdt> flags = new Map<String,FeatureFlag__mdt>();

        FeatureFlag__mdt flag1 = new FeatureFlag__mdt(DeveloperName = 'flag1', Is_Active__c = true);
        FeatureFlag__mdt flag2 = new FeatureFlag__mdt(DeveloperName = 'flag2', Is_Active__c = false);

        flags.put('flag1',flag1);
        flags.put('flag2',flag2);
        return flags;
        
    }

    public Map<String,Object> getAutomationControlFieldValues(){
        Map<String,Object> flags = new Map<String,Object>();

        flags.put('DisableAllAutomations__c', true);
        flags.put('DisableFeature1__c', true);
        flags.put('DisableFeature2__c', false);
        return flags;
        
    }

}

