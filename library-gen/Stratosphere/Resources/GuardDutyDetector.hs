{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-guardduty-detector.html

module Stratosphere.Resources.GuardDutyDetector where

import Stratosphere.ResourceImports


-- | Full data type definition for GuardDutyDetector. See 'guardDutyDetector'
-- for a more convenient constructor.
data GuardDutyDetector =
  GuardDutyDetector
  { _guardDutyDetectorEnable :: Val Bool
  , _guardDutyDetectorFindingPublishingFrequency :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON GuardDutyDetector where
  toJSON GuardDutyDetector{..} =
    object $
    catMaybes
    [ (Just . ("Enable",) . toJSON . fmap Bool') _guardDutyDetectorEnable
    , fmap (("FindingPublishingFrequency",) . toJSON) _guardDutyDetectorFindingPublishingFrequency
    ]

instance FromJSON GuardDutyDetector where
  parseJSON (Object obj) =
    GuardDutyDetector <$>
      fmap (fmap unBool') (obj .: "Enable") <*>
      (obj .:? "FindingPublishingFrequency")
  parseJSON _ = mempty

-- | Constructor for 'GuardDutyDetector' containing required fields as
-- arguments.
guardDutyDetector
  :: Val Bool -- ^ 'gddEnable'
  -> GuardDutyDetector
guardDutyDetector enablearg =
  GuardDutyDetector
  { _guardDutyDetectorEnable = enablearg
  , _guardDutyDetectorFindingPublishingFrequency = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-guardduty-detector.html#cfn-guardduty-detector-enable
gddEnable :: Lens' GuardDutyDetector (Val Bool)
gddEnable = lens _guardDutyDetectorEnable (\s a -> s { _guardDutyDetectorEnable = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-guardduty-detector.html#cfn-guardduty-detector-findingpublishingfrequency
gddFindingPublishingFrequency :: Lens' GuardDutyDetector (Maybe (Val Text))
gddFindingPublishingFrequency = lens _guardDutyDetectorFindingPublishingFrequency (\s a -> s { _guardDutyDetectorFindingPublishingFrequency = a })
