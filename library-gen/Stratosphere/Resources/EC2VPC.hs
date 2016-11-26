{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html

module Stratosphere.Resources.EC2VPC where

import Control.Lens
import Data.Aeson
import Data.Aeson.Types
import Data.Text
import GHC.Generics

import Stratosphere.Values


-- | Full data type definition for EC2VPC. See 'ec2VPC' for a more convenient
-- | constructor.
data EC2VPC =
  EC2VPC
  { _eC2VPCCidrBlock :: Val Text
  , _eC2VPCEnableDnsHostnames :: Maybe (Val Bool')
  , _eC2VPCEnableDnsSupport :: Maybe (Val Bool')
  , _eC2VPCInstanceTenancy :: Maybe (Val Text)
  } deriving (Show, Generic)

instance ToJSON EC2VPC where
  toJSON = genericToJSON defaultOptions { fieldLabelModifier = Prelude.drop 7, omitNothingFields = True }

instance FromJSON EC2VPC where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = Prelude.drop 7, omitNothingFields = True }

-- | Constructor for 'EC2VPC' containing required fields as arguments.
ec2VPC
  :: Val Text -- ^ 'ecvpcCidrBlock'
  -> EC2VPC
ec2VPC cidrBlockarg =
  EC2VPC
  { _eC2VPCCidrBlock = cidrBlockarg
  , _eC2VPCEnableDnsHostnames = Nothing
  , _eC2VPCEnableDnsSupport = Nothing
  , _eC2VPCInstanceTenancy = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html#cfn-aws-ec2-vpc-cidrblock
ecvpcCidrBlock :: Lens' EC2VPC (Val Text)
ecvpcCidrBlock = lens _eC2VPCCidrBlock (\s a -> s { _eC2VPCCidrBlock = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html#cfn-aws-ec2-vpc-EnableDnsHostnames
ecvpcEnableDnsHostnames :: Lens' EC2VPC (Maybe (Val Bool'))
ecvpcEnableDnsHostnames = lens _eC2VPCEnableDnsHostnames (\s a -> s { _eC2VPCEnableDnsHostnames = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html#cfn-aws-ec2-vpc-EnableDnsSupport
ecvpcEnableDnsSupport :: Lens' EC2VPC (Maybe (Val Bool'))
ecvpcEnableDnsSupport = lens _eC2VPCEnableDnsSupport (\s a -> s { _eC2VPCEnableDnsSupport = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html#cfn-aws-ec2-vpc-instancetenancy
ecvpcInstanceTenancy :: Lens' EC2VPC (Maybe (Val Text))
ecvpcInstanceTenancy = lens _eC2VPCInstanceTenancy (\s a -> s { _eC2VPCInstanceTenancy = a })
