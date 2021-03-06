{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-servicelinkedrole.html

module Stratosphere.Resources.IAMServiceLinkedRole where

import Stratosphere.ResourceImports


-- | Full data type definition for IAMServiceLinkedRole. See
-- 'iamServiceLinkedRole' for a more convenient constructor.
data IAMServiceLinkedRole =
  IAMServiceLinkedRole
  { _iAMServiceLinkedRoleAWSServiceName :: Val Text
  , _iAMServiceLinkedRoleCustomSuffix :: Maybe (Val Text)
  , _iAMServiceLinkedRoleDescription :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON IAMServiceLinkedRole where
  toJSON IAMServiceLinkedRole{..} =
    object $
    catMaybes
    [ (Just . ("AWSServiceName",) . toJSON) _iAMServiceLinkedRoleAWSServiceName
    , fmap (("CustomSuffix",) . toJSON) _iAMServiceLinkedRoleCustomSuffix
    , fmap (("Description",) . toJSON) _iAMServiceLinkedRoleDescription
    ]

instance FromJSON IAMServiceLinkedRole where
  parseJSON (Object obj) =
    IAMServiceLinkedRole <$>
      (obj .: "AWSServiceName") <*>
      (obj .:? "CustomSuffix") <*>
      (obj .:? "Description")
  parseJSON _ = mempty

-- | Constructor for 'IAMServiceLinkedRole' containing required fields as
-- arguments.
iamServiceLinkedRole
  :: Val Text -- ^ 'iamslrAWSServiceName'
  -> IAMServiceLinkedRole
iamServiceLinkedRole aWSServiceNamearg =
  IAMServiceLinkedRole
  { _iAMServiceLinkedRoleAWSServiceName = aWSServiceNamearg
  , _iAMServiceLinkedRoleCustomSuffix = Nothing
  , _iAMServiceLinkedRoleDescription = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-servicelinkedrole.html#cfn-iam-servicelinkedrole-awsservicename
iamslrAWSServiceName :: Lens' IAMServiceLinkedRole (Val Text)
iamslrAWSServiceName = lens _iAMServiceLinkedRoleAWSServiceName (\s a -> s { _iAMServiceLinkedRoleAWSServiceName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-servicelinkedrole.html#cfn-iam-servicelinkedrole-customsuffix
iamslrCustomSuffix :: Lens' IAMServiceLinkedRole (Maybe (Val Text))
iamslrCustomSuffix = lens _iAMServiceLinkedRoleCustomSuffix (\s a -> s { _iAMServiceLinkedRoleCustomSuffix = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-servicelinkedrole.html#cfn-iam-servicelinkedrole-description
iamslrDescription :: Lens' IAMServiceLinkedRole (Maybe (Val Text))
iamslrDescription = lens _iAMServiceLinkedRoleDescription (\s a -> s { _iAMServiceLinkedRoleDescription = a })
