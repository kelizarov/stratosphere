{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html

module Stratosphere.Resources.DirectoryServiceSimpleAD where

import Control.Lens
import Data.Aeson
import Data.Aeson.Types
import Data.Text
import GHC.Generics

import Stratosphere.Values
import Stratosphere.ResourceProperties.DirectoryServiceSimpleADVpcSettings

-- | Full data type definition for DirectoryServiceSimpleAD. See
-- | 'directoryServiceSimpleAD' for a more convenient constructor.
data DirectoryServiceSimpleAD =
  DirectoryServiceSimpleAD
  { _directoryServiceSimpleADCreateAlias :: Maybe (Val Bool')
  , _directoryServiceSimpleADDescription :: Maybe (Val Text)
  , _directoryServiceSimpleADEnableSso :: Maybe (Val Bool')
  , _directoryServiceSimpleADName :: Val Text
  , _directoryServiceSimpleADPassword :: Val Text
  , _directoryServiceSimpleADShortName :: Maybe (Val Text)
  , _directoryServiceSimpleADSize :: Val Text
  , _directoryServiceSimpleADVpcSettings :: DirectoryServiceSimpleADVpcSettings
  } deriving (Show, Generic)

instance ToJSON DirectoryServiceSimpleAD where
  toJSON = genericToJSON defaultOptions { fieldLabelModifier = Prelude.drop 25, omitNothingFields = True }

instance FromJSON DirectoryServiceSimpleAD where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = Prelude.drop 25, omitNothingFields = True }

-- | Constructor for 'DirectoryServiceSimpleAD' containing required fields as
-- | arguments.
directoryServiceSimpleAD
  :: Val Text -- ^ 'dssadName'
  -> Val Text -- ^ 'dssadPassword'
  -> Val Text -- ^ 'dssadSize'
  -> DirectoryServiceSimpleADVpcSettings -- ^ 'dssadVpcSettings'
  -> DirectoryServiceSimpleAD
directoryServiceSimpleAD namearg passwordarg sizearg vpcSettingsarg =
  DirectoryServiceSimpleAD
  { _directoryServiceSimpleADCreateAlias = Nothing
  , _directoryServiceSimpleADDescription = Nothing
  , _directoryServiceSimpleADEnableSso = Nothing
  , _directoryServiceSimpleADName = namearg
  , _directoryServiceSimpleADPassword = passwordarg
  , _directoryServiceSimpleADShortName = Nothing
  , _directoryServiceSimpleADSize = sizearg
  , _directoryServiceSimpleADVpcSettings = vpcSettingsarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-createalias
dssadCreateAlias :: Lens' DirectoryServiceSimpleAD (Maybe (Val Bool'))
dssadCreateAlias = lens _directoryServiceSimpleADCreateAlias (\s a -> s { _directoryServiceSimpleADCreateAlias = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-description
dssadDescription :: Lens' DirectoryServiceSimpleAD (Maybe (Val Text))
dssadDescription = lens _directoryServiceSimpleADDescription (\s a -> s { _directoryServiceSimpleADDescription = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-enablesso
dssadEnableSso :: Lens' DirectoryServiceSimpleAD (Maybe (Val Bool'))
dssadEnableSso = lens _directoryServiceSimpleADEnableSso (\s a -> s { _directoryServiceSimpleADEnableSso = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-name
dssadName :: Lens' DirectoryServiceSimpleAD (Val Text)
dssadName = lens _directoryServiceSimpleADName (\s a -> s { _directoryServiceSimpleADName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-password
dssadPassword :: Lens' DirectoryServiceSimpleAD (Val Text)
dssadPassword = lens _directoryServiceSimpleADPassword (\s a -> s { _directoryServiceSimpleADPassword = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-shortname
dssadShortName :: Lens' DirectoryServiceSimpleAD (Maybe (Val Text))
dssadShortName = lens _directoryServiceSimpleADShortName (\s a -> s { _directoryServiceSimpleADShortName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-size
dssadSize :: Lens' DirectoryServiceSimpleAD (Val Text)
dssadSize = lens _directoryServiceSimpleADSize (\s a -> s { _directoryServiceSimpleADSize = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-directoryservice-simplead.html#cfn-directoryservice-simplead-vpcsettings
dssadVpcSettings :: Lens' DirectoryServiceSimpleAD DirectoryServiceSimpleADVpcSettings
dssadVpcSettings = lens _directoryServiceSimpleADVpcSettings (\s a -> s { _directoryServiceSimpleADVpcSettings = a })
