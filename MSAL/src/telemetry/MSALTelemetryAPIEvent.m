// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MSALTelemetryAPIEvent.h"
#import "MSALTelemetryEventStrings.h"
#import "NSOrderedSet+MSALExtensions.h"

@implementation MSALTelemetryAPIEvent

- (void)setCorrelationId:(NSUUID *)correlationId
{
    [self setProperty:MSAL_TELEMETRY_KEY_CORRELATION_ID value:[correlationId UUIDString]];
}

- (void)setExtendedExpiresOnSetting:(NSString *)extendedExpiresOnSetting
{
    [self setProperty:MSAL_TELEMETRY_KEY_EXTENDED_EXPIRES_ON_SETTING value:extendedExpiresOnSetting];
}

- (void)setUser:(MSALUser *)user
{
    [self setProperty:MSAL_TELEMETRY_KEY_USER_ID value:[[user displayableId] msalComputeSHA256Hex]];
    //[self setProperty:MSAL_TELEMETRY_KEY_TENANT_ID value:[[user tenantId] msalComputeSHA256Hex]];
    [self setProperty:MSAL_TELEMETRY_KEY_IDP value:[user identityProvider]];
}

- (void)setClientId:(NSString *)clientId
{
    [self setProperty:MSAL_TELEMETRY_KEY_CLIENT_ID value:clientId];
}

- (void)setIsExtendedLifeTimeToken:(NSString *)isExtendedLifeToken
{
    [self setProperty:MSAL_TELEMETRY_KEY_IS_EXTENED_LIFE_TIME_TOKEN value:isExtendedLifeToken];
}

- (void)setProtocolCode:(NSString *)protocolCode
{
    [self setProperty:MSAL_TELEMETRY_KEY_PROTOCOL_CODE value:protocolCode];
}

- (void)setAuthorityValidationStatus:(NSString *)status
{
    [self setProperty:MSAL_TELEMETRY_KEY_AUTHORITY_VALIDATION_STATUS value:status];
}

- (void)setAuthority:(MSALAuthorityType)authorityType
{
    NSString *authorityTypeString;
    
    // set authority type
    switch (authorityType) {
        case AADAuthority:
            authorityTypeString = MSAL_TELEMETRY_VALUE_AUTHORITY_AAD;
            
            break;
            
        case ADFSAuthority:
            authorityTypeString = MSAL_TELEMETRY_VALUE_AUTHORITY_ADFS;
            break;
            
        case B2CAuthority:
            authorityTypeString = MSAL_TELEMETRY_VALUE_AUTHORITY_B2C;
            break;
    }
    
    [self setProperty:MSAL_TELEMETRY_KEY_AUTHORITY_TYPE value:authorityTypeString];
}

- (void)setGrantType:(NSString *)grantType
{
    [self setProperty:MSAL_TELEMETRY_KEY_GRANT_TYPE value:grantType];
}

- (void)setAPIStatus:(NSString *)status
{
    [self setProperty:MSAL_TELEMETRY_KEY_API_STATUS value:status];
}

- (void)setApiId:(MSALTelemetryApiId)apiId
{
    [self setProperty:MSAL_TELEMETRY_KEY_API_ID value:[NSString stringWithFormat:@"%d", (int)apiId]];
}

- (void)setUIBehavior:(MSALUIBehavior)uiBehavior
{
    NSString *uiBehaviorString = nil;
    
    switch (uiBehavior) {
        case MSALForceLogin:
            uiBehaviorString = @"MSAL_Force_Login";
            break;
            
        case MSALForceConsent:
            uiBehaviorString = @"MSAL_Force_Consent";
            break;
            
        case MSALSelectAccount:
            uiBehaviorString = @"MSAL_Select_Account";
    }
    
    [self setProperty:MSAL_TELEMETRY_KEY_PROMPT_BEHAVIOR value:uiBehaviorString];
}

#pragma mark -
#pragma mark log error

- (void)setErrorCode:(NSInteger)errorCode
{
    self.errorInEvent = YES;
    [self setProperty:MSAL_TELEMETRY_KEY_API_ERROR_CODE value:[NSString stringWithFormat:@"%ld", (long)errorCode]];
}

- (void)setErrorDescription:(NSString *)errorDescription
{
    [self setProperty:MSAL_TELEMETRY_KEY_ERROR_DESCRIPTION value:errorDescription];
}

- (void)setErrorDomain:(NSString *)errorDomain
{
    [self setProperty:MSAL_TELEMETRY_KEY_ERROR_DOMAIN value:errorDomain];
}

@end