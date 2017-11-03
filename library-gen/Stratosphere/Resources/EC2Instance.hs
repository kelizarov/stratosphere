{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html

module Stratosphere.Resources.EC2Instance where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.EC2InstanceBlockDeviceMapping
import Stratosphere.ResourceProperties.EC2InstanceElasticGpuSpecification
import Stratosphere.ResourceProperties.EC2InstanceInstanceIpv6Address
import Stratosphere.ResourceProperties.EC2InstanceNetworkInterface
import Stratosphere.ResourceProperties.EC2InstanceSsmAssociation
import Stratosphere.ResourceProperties.Tag
import Stratosphere.ResourceProperties.EC2InstanceVolume

-- | Full data type definition for EC2Instance. See 'ec2Instance' for a more
-- convenient constructor.
data EC2Instance =
  EC2Instance
  { _eC2InstanceAdditionalInfo :: Maybe (Val Text)
  , _eC2InstanceAffinity :: Maybe (Val Text)
  , _eC2InstanceAvailabilityZone :: Maybe (Val Text)
  , _eC2InstanceBlockDeviceMappings :: Maybe [EC2InstanceBlockDeviceMapping]
  , _eC2InstanceDisableApiTermination :: Maybe (Val Bool)
  , _eC2InstanceEbsOptimized :: Maybe (Val Bool)
  , _eC2InstanceElasticGpuSpecifications :: Maybe [EC2InstanceElasticGpuSpecification]
  , _eC2InstanceHostId :: Maybe (Val Text)
  , _eC2InstanceIamInstanceProfile :: Maybe (Val Text)
  , _eC2InstanceImageId :: Val Text
  , _eC2InstanceInstanceInitiatedShutdownBehavior :: Maybe (Val Text)
  , _eC2InstanceInstanceType :: Maybe (Val Text)
  , _eC2InstanceIpv6AddressCount :: Maybe (Val Integer)
  , _eC2InstanceIpv6Addresses :: Maybe [EC2InstanceInstanceIpv6Address]
  , _eC2InstanceKernelId :: Maybe (Val Text)
  , _eC2InstanceKeyName :: Maybe (Val Text)
  , _eC2InstanceMonitoring :: Maybe (Val Bool)
  , _eC2InstanceNetworkInterfaces :: Maybe [EC2InstanceNetworkInterface]
  , _eC2InstancePlacementGroupName :: Maybe (Val Text)
  , _eC2InstancePrivateIpAddress :: Maybe (Val Text)
  , _eC2InstanceRamdiskId :: Maybe (Val Text)
  , _eC2InstanceSecurityGroupIds :: Maybe (ValList Text)
  , _eC2InstanceSecurityGroups :: Maybe (ValList Text)
  , _eC2InstanceSourceDestCheck :: Maybe (Val Bool)
  , _eC2InstanceSsmAssociations :: Maybe [EC2InstanceSsmAssociation]
  , _eC2InstanceSubnetId :: Maybe (Val Text)
  , _eC2InstanceTags :: Maybe [Tag]
  , _eC2InstanceTenancy :: Maybe (Val Text)
  , _eC2InstanceUserData :: Maybe (Val Text)
  , _eC2InstanceVolumes :: Maybe [EC2InstanceVolume]
  } deriving (Show, Eq)

instance ToJSON EC2Instance where
  toJSON EC2Instance{..} =
    object $
    catMaybes
    [ fmap (("AdditionalInfo",) . toJSON) _eC2InstanceAdditionalInfo
    , fmap (("Affinity",) . toJSON) _eC2InstanceAffinity
    , fmap (("AvailabilityZone",) . toJSON) _eC2InstanceAvailabilityZone
    , fmap (("BlockDeviceMappings",) . toJSON) _eC2InstanceBlockDeviceMappings
    , fmap (("DisableApiTermination",) . toJSON . fmap Bool') _eC2InstanceDisableApiTermination
    , fmap (("EbsOptimized",) . toJSON . fmap Bool') _eC2InstanceEbsOptimized
    , fmap (("ElasticGpuSpecifications",) . toJSON) _eC2InstanceElasticGpuSpecifications
    , fmap (("HostId",) . toJSON) _eC2InstanceHostId
    , fmap (("IamInstanceProfile",) . toJSON) _eC2InstanceIamInstanceProfile
    , (Just . ("ImageId",) . toJSON) _eC2InstanceImageId
    , fmap (("InstanceInitiatedShutdownBehavior",) . toJSON) _eC2InstanceInstanceInitiatedShutdownBehavior
    , fmap (("InstanceType",) . toJSON) _eC2InstanceInstanceType
    , fmap (("Ipv6AddressCount",) . toJSON . fmap Integer') _eC2InstanceIpv6AddressCount
    , fmap (("Ipv6Addresses",) . toJSON) _eC2InstanceIpv6Addresses
    , fmap (("KernelId",) . toJSON) _eC2InstanceKernelId
    , fmap (("KeyName",) . toJSON) _eC2InstanceKeyName
    , fmap (("Monitoring",) . toJSON . fmap Bool') _eC2InstanceMonitoring
    , fmap (("NetworkInterfaces",) . toJSON) _eC2InstanceNetworkInterfaces
    , fmap (("PlacementGroupName",) . toJSON) _eC2InstancePlacementGroupName
    , fmap (("PrivateIpAddress",) . toJSON) _eC2InstancePrivateIpAddress
    , fmap (("RamdiskId",) . toJSON) _eC2InstanceRamdiskId
    , fmap (("SecurityGroupIds",) . toJSON) _eC2InstanceSecurityGroupIds
    , fmap (("SecurityGroups",) . toJSON) _eC2InstanceSecurityGroups
    , fmap (("SourceDestCheck",) . toJSON . fmap Bool') _eC2InstanceSourceDestCheck
    , fmap (("SsmAssociations",) . toJSON) _eC2InstanceSsmAssociations
    , fmap (("SubnetId",) . toJSON) _eC2InstanceSubnetId
    , fmap (("Tags",) . toJSON) _eC2InstanceTags
    , fmap (("Tenancy",) . toJSON) _eC2InstanceTenancy
    , fmap (("UserData",) . toJSON) _eC2InstanceUserData
    , fmap (("Volumes",) . toJSON) _eC2InstanceVolumes
    ]

instance FromJSON EC2Instance where
  parseJSON (Object obj) =
    EC2Instance <$>
      (obj .:? "AdditionalInfo") <*>
      (obj .:? "Affinity") <*>
      (obj .:? "AvailabilityZone") <*>
      (obj .:? "BlockDeviceMappings") <*>
      fmap (fmap (fmap unBool')) (obj .:? "DisableApiTermination") <*>
      fmap (fmap (fmap unBool')) (obj .:? "EbsOptimized") <*>
      (obj .:? "ElasticGpuSpecifications") <*>
      (obj .:? "HostId") <*>
      (obj .:? "IamInstanceProfile") <*>
      (obj .: "ImageId") <*>
      (obj .:? "InstanceInitiatedShutdownBehavior") <*>
      (obj .:? "InstanceType") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "Ipv6AddressCount") <*>
      (obj .:? "Ipv6Addresses") <*>
      (obj .:? "KernelId") <*>
      (obj .:? "KeyName") <*>
      fmap (fmap (fmap unBool')) (obj .:? "Monitoring") <*>
      (obj .:? "NetworkInterfaces") <*>
      (obj .:? "PlacementGroupName") <*>
      (obj .:? "PrivateIpAddress") <*>
      (obj .:? "RamdiskId") <*>
      (obj .:? "SecurityGroupIds") <*>
      (obj .:? "SecurityGroups") <*>
      fmap (fmap (fmap unBool')) (obj .:? "SourceDestCheck") <*>
      (obj .:? "SsmAssociations") <*>
      (obj .:? "SubnetId") <*>
      (obj .:? "Tags") <*>
      (obj .:? "Tenancy") <*>
      (obj .:? "UserData") <*>
      (obj .:? "Volumes")
  parseJSON _ = mempty

-- | Constructor for 'EC2Instance' containing required fields as arguments.
ec2Instance
  :: Val Text -- ^ 'eciImageId'
  -> EC2Instance
ec2Instance imageIdarg =
  EC2Instance
  { _eC2InstanceAdditionalInfo = Nothing
  , _eC2InstanceAffinity = Nothing
  , _eC2InstanceAvailabilityZone = Nothing
  , _eC2InstanceBlockDeviceMappings = Nothing
  , _eC2InstanceDisableApiTermination = Nothing
  , _eC2InstanceEbsOptimized = Nothing
  , _eC2InstanceElasticGpuSpecifications = Nothing
  , _eC2InstanceHostId = Nothing
  , _eC2InstanceIamInstanceProfile = Nothing
  , _eC2InstanceImageId = imageIdarg
  , _eC2InstanceInstanceInitiatedShutdownBehavior = Nothing
  , _eC2InstanceInstanceType = Nothing
  , _eC2InstanceIpv6AddressCount = Nothing
  , _eC2InstanceIpv6Addresses = Nothing
  , _eC2InstanceKernelId = Nothing
  , _eC2InstanceKeyName = Nothing
  , _eC2InstanceMonitoring = Nothing
  , _eC2InstanceNetworkInterfaces = Nothing
  , _eC2InstancePlacementGroupName = Nothing
  , _eC2InstancePrivateIpAddress = Nothing
  , _eC2InstanceRamdiskId = Nothing
  , _eC2InstanceSecurityGroupIds = Nothing
  , _eC2InstanceSecurityGroups = Nothing
  , _eC2InstanceSourceDestCheck = Nothing
  , _eC2InstanceSsmAssociations = Nothing
  , _eC2InstanceSubnetId = Nothing
  , _eC2InstanceTags = Nothing
  , _eC2InstanceTenancy = Nothing
  , _eC2InstanceUserData = Nothing
  , _eC2InstanceVolumes = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-additionalinfo
eciAdditionalInfo :: Lens' EC2Instance (Maybe (Val Text))
eciAdditionalInfo = lens _eC2InstanceAdditionalInfo (\s a -> s { _eC2InstanceAdditionalInfo = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-affinity
eciAffinity :: Lens' EC2Instance (Maybe (Val Text))
eciAffinity = lens _eC2InstanceAffinity (\s a -> s { _eC2InstanceAffinity = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-availabilityzone
eciAvailabilityZone :: Lens' EC2Instance (Maybe (Val Text))
eciAvailabilityZone = lens _eC2InstanceAvailabilityZone (\s a -> s { _eC2InstanceAvailabilityZone = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-blockdevicemappings
eciBlockDeviceMappings :: Lens' EC2Instance (Maybe [EC2InstanceBlockDeviceMapping])
eciBlockDeviceMappings = lens _eC2InstanceBlockDeviceMappings (\s a -> s { _eC2InstanceBlockDeviceMappings = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-disableapitermination
eciDisableApiTermination :: Lens' EC2Instance (Maybe (Val Bool))
eciDisableApiTermination = lens _eC2InstanceDisableApiTermination (\s a -> s { _eC2InstanceDisableApiTermination = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-ebsoptimized
eciEbsOptimized :: Lens' EC2Instance (Maybe (Val Bool))
eciEbsOptimized = lens _eC2InstanceEbsOptimized (\s a -> s { _eC2InstanceEbsOptimized = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-elasticgpuspecifications
eciElasticGpuSpecifications :: Lens' EC2Instance (Maybe [EC2InstanceElasticGpuSpecification])
eciElasticGpuSpecifications = lens _eC2InstanceElasticGpuSpecifications (\s a -> s { _eC2InstanceElasticGpuSpecifications = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-hostid
eciHostId :: Lens' EC2Instance (Maybe (Val Text))
eciHostId = lens _eC2InstanceHostId (\s a -> s { _eC2InstanceHostId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-iaminstanceprofile
eciIamInstanceProfile :: Lens' EC2Instance (Maybe (Val Text))
eciIamInstanceProfile = lens _eC2InstanceIamInstanceProfile (\s a -> s { _eC2InstanceIamInstanceProfile = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-imageid
eciImageId :: Lens' EC2Instance (Val Text)
eciImageId = lens _eC2InstanceImageId (\s a -> s { _eC2InstanceImageId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-instanceinitiatedshutdownbehavior
eciInstanceInitiatedShutdownBehavior :: Lens' EC2Instance (Maybe (Val Text))
eciInstanceInitiatedShutdownBehavior = lens _eC2InstanceInstanceInitiatedShutdownBehavior (\s a -> s { _eC2InstanceInstanceInitiatedShutdownBehavior = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-instancetype
eciInstanceType :: Lens' EC2Instance (Maybe (Val Text))
eciInstanceType = lens _eC2InstanceInstanceType (\s a -> s { _eC2InstanceInstanceType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-ipv6addresscount
eciIpv6AddressCount :: Lens' EC2Instance (Maybe (Val Integer))
eciIpv6AddressCount = lens _eC2InstanceIpv6AddressCount (\s a -> s { _eC2InstanceIpv6AddressCount = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-ipv6addresses
eciIpv6Addresses :: Lens' EC2Instance (Maybe [EC2InstanceInstanceIpv6Address])
eciIpv6Addresses = lens _eC2InstanceIpv6Addresses (\s a -> s { _eC2InstanceIpv6Addresses = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-kernelid
eciKernelId :: Lens' EC2Instance (Maybe (Val Text))
eciKernelId = lens _eC2InstanceKernelId (\s a -> s { _eC2InstanceKernelId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-keyname
eciKeyName :: Lens' EC2Instance (Maybe (Val Text))
eciKeyName = lens _eC2InstanceKeyName (\s a -> s { _eC2InstanceKeyName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-monitoring
eciMonitoring :: Lens' EC2Instance (Maybe (Val Bool))
eciMonitoring = lens _eC2InstanceMonitoring (\s a -> s { _eC2InstanceMonitoring = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-networkinterfaces
eciNetworkInterfaces :: Lens' EC2Instance (Maybe [EC2InstanceNetworkInterface])
eciNetworkInterfaces = lens _eC2InstanceNetworkInterfaces (\s a -> s { _eC2InstanceNetworkInterfaces = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-placementgroupname
eciPlacementGroupName :: Lens' EC2Instance (Maybe (Val Text))
eciPlacementGroupName = lens _eC2InstancePlacementGroupName (\s a -> s { _eC2InstancePlacementGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-privateipaddress
eciPrivateIpAddress :: Lens' EC2Instance (Maybe (Val Text))
eciPrivateIpAddress = lens _eC2InstancePrivateIpAddress (\s a -> s { _eC2InstancePrivateIpAddress = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-ramdiskid
eciRamdiskId :: Lens' EC2Instance (Maybe (Val Text))
eciRamdiskId = lens _eC2InstanceRamdiskId (\s a -> s { _eC2InstanceRamdiskId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-securitygroupids
eciSecurityGroupIds :: Lens' EC2Instance (Maybe (ValList Text))
eciSecurityGroupIds = lens _eC2InstanceSecurityGroupIds (\s a -> s { _eC2InstanceSecurityGroupIds = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-securitygroups
eciSecurityGroups :: Lens' EC2Instance (Maybe (ValList Text))
eciSecurityGroups = lens _eC2InstanceSecurityGroups (\s a -> s { _eC2InstanceSecurityGroups = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-sourcedestcheck
eciSourceDestCheck :: Lens' EC2Instance (Maybe (Val Bool))
eciSourceDestCheck = lens _eC2InstanceSourceDestCheck (\s a -> s { _eC2InstanceSourceDestCheck = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-ssmassociations
eciSsmAssociations :: Lens' EC2Instance (Maybe [EC2InstanceSsmAssociation])
eciSsmAssociations = lens _eC2InstanceSsmAssociations (\s a -> s { _eC2InstanceSsmAssociations = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-subnetid
eciSubnetId :: Lens' EC2Instance (Maybe (Val Text))
eciSubnetId = lens _eC2InstanceSubnetId (\s a -> s { _eC2InstanceSubnetId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-tags
eciTags :: Lens' EC2Instance (Maybe [Tag])
eciTags = lens _eC2InstanceTags (\s a -> s { _eC2InstanceTags = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-tenancy
eciTenancy :: Lens' EC2Instance (Maybe (Val Text))
eciTenancy = lens _eC2InstanceTenancy (\s a -> s { _eC2InstanceTenancy = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-userdata
eciUserData :: Lens' EC2Instance (Maybe (Val Text))
eciUserData = lens _eC2InstanceUserData (\s a -> s { _eC2InstanceUserData = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html#cfn-ec2-instance-volumes
eciVolumes :: Lens' EC2Instance (Maybe [EC2InstanceVolume])
eciVolumes = lens _eC2InstanceVolumes (\s a -> s { _eC2InstanceVolumes = a })
