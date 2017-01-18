{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

-- | You associate the CreationPolicy attribute with a resource to prevent its
-- status from reaching create complete until AWS CloudFormation receives a
-- specified number of success signals or the timeout period is exceeded. To
-- signal a resource, you can use the cfn-signal helper script or
-- SignalResource API. AWS CloudFormation publishes valid signals to the stack
-- events so that you track the number of signals sent. The creation policy is
-- invoked only when AWS CloudFormation creates the associated resource.
-- Currently, the only AWS CloudFormation resources that support creation
-- policies are AWS::AutoScaling::AutoScalingGroup, AWS::EC2::Instance, and
-- AWS::CloudFormation::WaitCondition. The CreationPolicy attribute is helpful
-- when you want to wait on resource configuration actions before stack
-- creation proceeds. For example, if you install and configure software
-- applications on an Amazon EC2 instance, you might want those applications
-- up and running before proceeding. In such cases, you can add a
-- CreationPolicy attribute to the instance and then send a success signal to
-- the instance after the applications are installed and configured. For a
-- detailed example, see Deploying Applications on Amazon EC2 with AWS
-- CloudFormation.

module Stratosphere.ResourceAttributes.CreationPolicy where

import Control.Lens
import Data.Aeson
import Data.Aeson.Types
import Data.Text
import GHC.Generics

import Stratosphere.Values
import Stratosphere.ResourceAttributes.ResourceSignal

-- | Full data type definition for CreationPolicy. See 'creationPolicy' for a
-- more convenient constructor.
data CreationPolicy =
  CreationPolicy
  { _creationPolicyResourceSignal :: ResourceSignal
  } deriving (Show, Eq, Generic)

instance ToJSON CreationPolicy where
  toJSON = genericToJSON defaultOptions { fieldLabelModifier = Prelude.drop 15, omitNothingFields = True }

instance FromJSON CreationPolicy where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = Prelude.drop 15, omitNothingFields = True }

-- | Constructor for 'CreationPolicy' containing required fields as arguments.
creationPolicy
  :: ResourceSignal -- ^ 'cpResourceSignal'
  -> CreationPolicy
creationPolicy resourceSignalarg =
  CreationPolicy
  { _creationPolicyResourceSignal = resourceSignalarg
  }

-- |
cpResourceSignal :: Lens' CreationPolicy ResourceSignal
cpResourceSignal = lens _creationPolicyResourceSignal (\s a -> s { _creationPolicyResourceSignal = a })
