{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-inspector-assessmenttarget.html

module Stratosphere.Resources.InspectorAssessmentTarget where

import Stratosphere.ResourceImports


-- | Full data type definition for InspectorAssessmentTarget. See
-- 'inspectorAssessmentTarget' for a more convenient constructor.
data InspectorAssessmentTarget =
  InspectorAssessmentTarget
  { _inspectorAssessmentTargetAssessmentTargetName :: Maybe (Val Text)
  , _inspectorAssessmentTargetResourceGroupArn :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON InspectorAssessmentTarget where
  toJSON InspectorAssessmentTarget{..} =
    object $
    catMaybes
    [ fmap (("AssessmentTargetName",) . toJSON) _inspectorAssessmentTargetAssessmentTargetName
    , fmap (("ResourceGroupArn",) . toJSON) _inspectorAssessmentTargetResourceGroupArn
    ]

instance FromJSON InspectorAssessmentTarget where
  parseJSON (Object obj) =
    InspectorAssessmentTarget <$>
      (obj .:? "AssessmentTargetName") <*>
      (obj .:? "ResourceGroupArn")
  parseJSON _ = mempty

-- | Constructor for 'InspectorAssessmentTarget' containing required fields as
-- arguments.
inspectorAssessmentTarget
  :: InspectorAssessmentTarget
inspectorAssessmentTarget  =
  InspectorAssessmentTarget
  { _inspectorAssessmentTargetAssessmentTargetName = Nothing
  , _inspectorAssessmentTargetResourceGroupArn = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-inspector-assessmenttarget.html#cfn-inspector-assessmenttarget-assessmenttargetname
iatAssessmentTargetName :: Lens' InspectorAssessmentTarget (Maybe (Val Text))
iatAssessmentTargetName = lens _inspectorAssessmentTargetAssessmentTargetName (\s a -> s { _inspectorAssessmentTargetAssessmentTargetName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-inspector-assessmenttarget.html#cfn-inspector-assessmenttarget-resourcegrouparn
iatResourceGroupArn :: Lens' InspectorAssessmentTarget (Maybe (Val Text))
iatResourceGroupArn = lens _inspectorAssessmentTargetResourceGroupArn (\s a -> s { _inspectorAssessmentTargetResourceGroupArn = a })
