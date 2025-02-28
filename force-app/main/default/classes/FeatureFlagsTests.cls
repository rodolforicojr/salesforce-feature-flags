@IsTest
private class FeatureFlagsTests {
    
    @IsTest
    static void testFeatureDisableAllAutomationsCustomSettings() {

        FeatureFlagProviderDisableAllMock mockFlags = new FeatureFlagProviderDisableAllMock();
        FeatureFlags flags = new FeatureFlags(mockFlags);

        Test.startTest();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('DisableAllAutomations');
        Test.stopTest();

        System.debug(result);

        System.assertEquals(true, result.isEnabled());
        System.assertEquals('DisableAllAutomations', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.ALL_AUTOMATIONS_DISABLED, result.getReason());
    }

    @IsTest
    static void testFeatureDisabledWithCustomSettings() {

        FeatureFlagProviderMock mockFlags = new FeatureFlagProviderMock();
        FeatureFlags flags = new FeatureFlags(mockFlags);

        Test.startTest();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('DisableFeature1');
        Test.stopTest();

        System.assertEquals(true, result.isEnabled());
        System.assertEquals('DisableFeature1', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.HAS_CUSTOM_SETTINGS, result.getReason());
    }
    
    @IsTest
    static void testFeatureEnabledWithCustomSettings() {

        FeatureFlagProviderMock mockFlags = new FeatureFlagProviderMock();
        FeatureFlags flags = new FeatureFlags(mockFlags);

        Test.startTest();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('DisableFeature2');
        Test.stopTest();

        System.assertEquals(false, result.isEnabled());
        System.assertEquals('DisableFeature2', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.HAS_CUSTOM_SETTINGS, result.getReason());
    }

    @IsTest
    static void testFeatureEnabledWithCustomMetadata() {

        FeatureFlagProviderMock mockFlags = new FeatureFlagProviderMock();
        FeatureFlags flags = new FeatureFlags(mockFlags);

        Test.startTest();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('flag1');
        Test.stopTest();

        System.assertEquals(true, result.isEnabled());
        System.assertEquals('flag1', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.CUSTOM_METADATA_TYPE_ENABLED, result.getReason());
    }

    @IsTest
    static void testFeatureDisabledWithCustomMetadata() {

        FeatureFlagProviderMock mockFlags = new FeatureFlagProviderMock();
        FeatureFlags flags = new FeatureFlags(mockFlags);

        Test.startTest();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('flag2');
        Test.stopTest();


        System.assertEquals(false, result.isEnabled());
        System.assertEquals('flag2', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.CUSTOM_METADATA_TYPE_DISABLED, result.getReason());
    }

    @IsTest
    static void testFeatureDisabledWithMissingCustomPermission() {

        FeatureFlagProviderMock mockFlags = new FeatureFlagProviderMock();
        FeatureFlags flags = new FeatureFlags(mockFlags);

        Test.startTest();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('permission1');
        Test.stopTest();

    
        System.assertEquals(false, result.isEnabled());
        System.assertEquals('permission1', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.MISSING_CUSTOM_PERMISSION, result.getReason());
    }

    @IsTest
    static void testFeatureNotFound() {

        FeatureFlagProviderMock mockFlags = new FeatureFlagProviderMock();
        FeatureFlags flags = new FeatureFlags(mockFlags);

        Test.startTest();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('RandomFeature');
        Test.stopTest();

    
        System.assertEquals(false, result.isEnabled());
        System.assertEquals('RandomFeature', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.FLAG_NOT_FOUND, result.getReason());
    }

    @IsTest
    static void testFeatureFlagProvider(){
        FeatureFlagProvider provider = new FeatureFlagProvider();
        provider.getCustomPermissionNames();
        provider.getFeatureFlags();
    }

    @IsTest 
    static void testMockValues(){

        FeatureFlags.setMockValue('mockedFeatureValue', true);
 

        Test.startTest();

        FeatureFlags flags = new FeatureFlags();
        FeatureFlags.FeatureEvaluationResult result = flags.evaluate('mockedFeatureValue');
        Test.stopTest();

        System.assert(true, result.isEnabled());
        System.assertEquals('mockedFeatureValue', result.getFeatureName());
        System.assertEquals(FeatureFlags.FeatureReason.MOCK_VALUE, result.getReason());

    }

   
}
