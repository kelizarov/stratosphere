{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-as-mixedinstancespolicy-instancesdistribution.html

module Stratosphere.ResourceProperties.AutoScalingAutoScalingGroupInstancesDistribution where

import Stratosphere.ResourceImports


-- | Full data type definition for
-- AutoScalingAutoScalingGroupInstancesDistribution. See
-- 'autoScalingAutoScalingGroupInstancesDistribution' for a more convenient
-- constructor.
data AutoScalingAutoScalingGroupInstancesDistribution =
  AutoScalingAutoScalingGroupInstancesDistribution
  { _autoScalingAutoScalingGroupInstancesDistributionOnDemandAllocationStrategy :: Maybe (Val Text)
  , _autoScalingAutoScalingGroupInstancesDistributionOnDemandBaseCapacity :: Maybe (Val Integer)
  , _autoScalingAutoScalingGroupInstancesDistributionOnDemandPercentageAboveBaseCapacity :: Maybe (Val Integer)
  , _autoScalingAutoScalingGroupInstancesDistributionSpotAllocationStrategy :: Maybe (Val Text)
  , _autoScalingAutoScalingGroupInstancesDistributionSpotInstancePools :: Maybe (Val Integer)
  , _autoScalingAutoScalingGroupInstancesDistributionSpotMaxPrice :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON AutoScalingAutoScalingGroupInstancesDistribution where
  toJSON AutoScalingAutoScalingGroupInstancesDistribution{..} =
    object $
    catMaybes
    [ fmap (("OnDemandAllocationStrategy",) . toJSON) _autoScalingAutoScalingGroupInstancesDistributionOnDemandAllocationStrategy
    , fmap (("OnDemandBaseCapacity",) . toJSON . fmap Integer') _autoScalingAutoScalingGroupInstancesDistributionOnDemandBaseCapacity
    , fmap (("OnDemandPercentageAboveBaseCapacity",) . toJSON . fmap Integer') _autoScalingAutoScalingGroupInstancesDistributionOnDemandPercentageAboveBaseCapacity
    , fmap (("SpotAllocationStrategy",) . toJSON) _autoScalingAutoScalingGroupInstancesDistributionSpotAllocationStrategy
    , fmap (("SpotInstancePools",) . toJSON . fmap Integer') _autoScalingAutoScalingGroupInstancesDistributionSpotInstancePools
    , fmap (("SpotMaxPrice",) . toJSON) _autoScalingAutoScalingGroupInstancesDistributionSpotMaxPrice
    ]

instance FromJSON AutoScalingAutoScalingGroupInstancesDistribution where
  parseJSON (Object obj) =
    AutoScalingAutoScalingGroupInstancesDistribution <$>
      (obj .:? "OnDemandAllocationStrategy") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "OnDemandBaseCapacity") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "OnDemandPercentageAboveBaseCapacity") <*>
      (obj .:? "SpotAllocationStrategy") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "SpotInstancePools") <*>
      (obj .:? "SpotMaxPrice")
  parseJSON _ = mempty

-- | Constructor for 'AutoScalingAutoScalingGroupInstancesDistribution'
-- containing required fields as arguments.
autoScalingAutoScalingGroupInstancesDistribution
  :: AutoScalingAutoScalingGroupInstancesDistribution
autoScalingAutoScalingGroupInstancesDistribution  =
  AutoScalingAutoScalingGroupInstancesDistribution
  { _autoScalingAutoScalingGroupInstancesDistributionOnDemandAllocationStrategy = Nothing
  , _autoScalingAutoScalingGroupInstancesDistributionOnDemandBaseCapacity = Nothing
  , _autoScalingAutoScalingGroupInstancesDistributionOnDemandPercentageAboveBaseCapacity = Nothing
  , _autoScalingAutoScalingGroupInstancesDistributionSpotAllocationStrategy = Nothing
  , _autoScalingAutoScalingGroupInstancesDistributionSpotInstancePools = Nothing
  , _autoScalingAutoScalingGroupInstancesDistributionSpotMaxPrice = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-as-mixedinstancespolicy-instancesdistribution.html#cfn-autoscaling-autoscalinggroup-instancesdistribution-ondemandallocationstrategy
asasgidOnDemandAllocationStrategy :: Lens' AutoScalingAutoScalingGroupInstancesDistribution (Maybe (Val Text))
asasgidOnDemandAllocationStrategy = lens _autoScalingAutoScalingGroupInstancesDistributionOnDemandAllocationStrategy (\s a -> s { _autoScalingAutoScalingGroupInstancesDistributionOnDemandAllocationStrategy = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-as-mixedinstancespolicy-instancesdistribution.html#cfn-autoscaling-autoscalinggroup-instancesdistribution-ondemandbasecapacity
asasgidOnDemandBaseCapacity :: Lens' AutoScalingAutoScalingGroupInstancesDistribution (Maybe (Val Integer))
asasgidOnDemandBaseCapacity = lens _autoScalingAutoScalingGroupInstancesDistributionOnDemandBaseCapacity (\s a -> s { _autoScalingAutoScalingGroupInstancesDistributionOnDemandBaseCapacity = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-as-mixedinstancespolicy-instancesdistribution.html#cfn-autoscaling-autoscalinggroup-instancesdistribution-ondemandpercentageabovebasecapacity
asasgidOnDemandPercentageAboveBaseCapacity :: Lens' AutoScalingAutoScalingGroupInstancesDistribution (Maybe (Val Integer))
asasgidOnDemandPercentageAboveBaseCapacity = lens _autoScalingAutoScalingGroupInstancesDistributionOnDemandPercentageAboveBaseCapacity (\s a -> s { _autoScalingAutoScalingGroupInstancesDistributionOnDemandPercentageAboveBaseCapacity = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-as-mixedinstancespolicy-instancesdistribution.html#cfn-autoscaling-autoscalinggroup-instancesdistribution-spotallocationstrategy
asasgidSpotAllocationStrategy :: Lens' AutoScalingAutoScalingGroupInstancesDistribution (Maybe (Val Text))
asasgidSpotAllocationStrategy = lens _autoScalingAutoScalingGroupInstancesDistributionSpotAllocationStrategy (\s a -> s { _autoScalingAutoScalingGroupInstancesDistributionSpotAllocationStrategy = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-as-mixedinstancespolicy-instancesdistribution.html#cfn-autoscaling-autoscalinggroup-instancesdistribution-spotinstancepools
asasgidSpotInstancePools :: Lens' AutoScalingAutoScalingGroupInstancesDistribution (Maybe (Val Integer))
asasgidSpotInstancePools = lens _autoScalingAutoScalingGroupInstancesDistributionSpotInstancePools (\s a -> s { _autoScalingAutoScalingGroupInstancesDistributionSpotInstancePools = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-as-mixedinstancespolicy-instancesdistribution.html#cfn-autoscaling-autoscalinggroup-instancesdistribution-spotmaxprice
asasgidSpotMaxPrice :: Lens' AutoScalingAutoScalingGroupInstancesDistribution (Maybe (Val Text))
asasgidSpotMaxPrice = lens _autoScalingAutoScalingGroupInstancesDistributionSpotMaxPrice (\s a -> s { _autoScalingAutoScalingGroupInstancesDistributionSpotMaxPrice = a })
