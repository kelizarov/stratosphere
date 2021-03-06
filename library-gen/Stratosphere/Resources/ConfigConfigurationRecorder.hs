{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-configurationrecorder.html

module Stratosphere.Resources.ConfigConfigurationRecorder where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.ConfigConfigurationRecorderRecordingGroup

-- | Full data type definition for ConfigConfigurationRecorder. See
-- 'configConfigurationRecorder' for a more convenient constructor.
data ConfigConfigurationRecorder =
  ConfigConfigurationRecorder
  { _configConfigurationRecorderName :: Maybe (Val Text)
  , _configConfigurationRecorderRecordingGroup :: Maybe ConfigConfigurationRecorderRecordingGroup
  , _configConfigurationRecorderRoleARN :: Val Text
  } deriving (Show, Eq)

instance ToJSON ConfigConfigurationRecorder where
  toJSON ConfigConfigurationRecorder{..} =
    object $
    catMaybes
    [ fmap (("Name",) . toJSON) _configConfigurationRecorderName
    , fmap (("RecordingGroup",) . toJSON) _configConfigurationRecorderRecordingGroup
    , (Just . ("RoleARN",) . toJSON) _configConfigurationRecorderRoleARN
    ]

instance FromJSON ConfigConfigurationRecorder where
  parseJSON (Object obj) =
    ConfigConfigurationRecorder <$>
      (obj .:? "Name") <*>
      (obj .:? "RecordingGroup") <*>
      (obj .: "RoleARN")
  parseJSON _ = mempty

-- | Constructor for 'ConfigConfigurationRecorder' containing required fields
-- as arguments.
configConfigurationRecorder
  :: Val Text -- ^ 'ccrRoleARN'
  -> ConfigConfigurationRecorder
configConfigurationRecorder roleARNarg =
  ConfigConfigurationRecorder
  { _configConfigurationRecorderName = Nothing
  , _configConfigurationRecorderRecordingGroup = Nothing
  , _configConfigurationRecorderRoleARN = roleARNarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-configurationrecorder.html#cfn-config-configurationrecorder-name
ccrName :: Lens' ConfigConfigurationRecorder (Maybe (Val Text))
ccrName = lens _configConfigurationRecorderName (\s a -> s { _configConfigurationRecorderName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-configurationrecorder.html#cfn-config-configurationrecorder-recordinggroup
ccrRecordingGroup :: Lens' ConfigConfigurationRecorder (Maybe ConfigConfigurationRecorderRecordingGroup)
ccrRecordingGroup = lens _configConfigurationRecorderRecordingGroup (\s a -> s { _configConfigurationRecorderRecordingGroup = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-configurationrecorder.html#cfn-config-configurationrecorder-rolearn
ccrRoleARN :: Lens' ConfigConfigurationRecorder (Val Text)
ccrRoleARN = lens _configConfigurationRecorderRoleARN (\s a -> s { _configConfigurationRecorderRoleARN = a })
