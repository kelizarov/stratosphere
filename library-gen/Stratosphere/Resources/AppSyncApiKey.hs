{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appsync-apikey.html

module Stratosphere.Resources.AppSyncApiKey where

import Stratosphere.ResourceImports


-- | Full data type definition for AppSyncApiKey. See 'appSyncApiKey' for a
-- more convenient constructor.
data AppSyncApiKey =
  AppSyncApiKey
  { _appSyncApiKeyApiId :: Val Text
  , _appSyncApiKeyDescription :: Maybe (Val Text)
  , _appSyncApiKeyExpires :: Maybe (Val Double)
  } deriving (Show, Eq)

instance ToJSON AppSyncApiKey where
  toJSON AppSyncApiKey{..} =
    object $
    catMaybes
    [ (Just . ("ApiId",) . toJSON) _appSyncApiKeyApiId
    , fmap (("Description",) . toJSON) _appSyncApiKeyDescription
    , fmap (("Expires",) . toJSON . fmap Double') _appSyncApiKeyExpires
    ]

instance FromJSON AppSyncApiKey where
  parseJSON (Object obj) =
    AppSyncApiKey <$>
      (obj .: "ApiId") <*>
      (obj .:? "Description") <*>
      fmap (fmap (fmap unDouble')) (obj .:? "Expires")
  parseJSON _ = mempty

-- | Constructor for 'AppSyncApiKey' containing required fields as arguments.
appSyncApiKey
  :: Val Text -- ^ 'asakApiId'
  -> AppSyncApiKey
appSyncApiKey apiIdarg =
  AppSyncApiKey
  { _appSyncApiKeyApiId = apiIdarg
  , _appSyncApiKeyDescription = Nothing
  , _appSyncApiKeyExpires = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appsync-apikey.html#cfn-appsync-apikey-apiid
asakApiId :: Lens' AppSyncApiKey (Val Text)
asakApiId = lens _appSyncApiKeyApiId (\s a -> s { _appSyncApiKeyApiId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appsync-apikey.html#cfn-appsync-apikey-description
asakDescription :: Lens' AppSyncApiKey (Maybe (Val Text))
asakDescription = lens _appSyncApiKeyDescription (\s a -> s { _appSyncApiKeyDescription = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appsync-apikey.html#cfn-appsync-apikey-expires
asakExpires :: Lens' AppSyncApiKey (Maybe (Val Double))
asakExpires = lens _appSyncApiKeyExpires (\s a -> s { _appSyncApiKeyExpires = a })
