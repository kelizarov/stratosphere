{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html

module Stratosphere.Resources.CloudWatchAlarm where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.CloudWatchAlarmDimension

-- | Full data type definition for CloudWatchAlarm. See 'cloudWatchAlarm' for
-- a more convenient constructor.
data CloudWatchAlarm =
  CloudWatchAlarm
  { _cloudWatchAlarmActionsEnabled :: Maybe (Val Bool)
  , _cloudWatchAlarmAlarmActions :: Maybe (ValList Text)
  , _cloudWatchAlarmAlarmDescription :: Maybe (Val Text)
  , _cloudWatchAlarmAlarmName :: Maybe (Val Text)
  , _cloudWatchAlarmComparisonOperator :: Val Text
  , _cloudWatchAlarmDatapointsToAlarm :: Maybe (Val Integer)
  , _cloudWatchAlarmDimensions :: Maybe [CloudWatchAlarmDimension]
  , _cloudWatchAlarmEvaluateLowSampleCountPercentile :: Maybe (Val Text)
  , _cloudWatchAlarmEvaluationPeriods :: Val Integer
  , _cloudWatchAlarmExtendedStatistic :: Maybe (Val Text)
  , _cloudWatchAlarmInsufficientDataActions :: Maybe (ValList Text)
  , _cloudWatchAlarmMetricName :: Maybe (Val Text)
  , _cloudWatchAlarmNamespace :: Maybe (Val Text)
  , _cloudWatchAlarmOKActions :: Maybe (ValList Text)
  , _cloudWatchAlarmPeriod :: Maybe (Val Integer)
  , _cloudWatchAlarmStatistic :: Maybe (Val Text)
  , _cloudWatchAlarmThreshold :: Val Double
  , _cloudWatchAlarmTreatMissingData :: Maybe (Val Text)
  , _cloudWatchAlarmUnit :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON CloudWatchAlarm where
  toJSON CloudWatchAlarm{..} =
    object $
    catMaybes
    [ fmap (("ActionsEnabled",) . toJSON . fmap Bool') _cloudWatchAlarmActionsEnabled
    , fmap (("AlarmActions",) . toJSON) _cloudWatchAlarmAlarmActions
    , fmap (("AlarmDescription",) . toJSON) _cloudWatchAlarmAlarmDescription
    , fmap (("AlarmName",) . toJSON) _cloudWatchAlarmAlarmName
    , (Just . ("ComparisonOperator",) . toJSON) _cloudWatchAlarmComparisonOperator
    , fmap (("DatapointsToAlarm",) . toJSON . fmap Integer') _cloudWatchAlarmDatapointsToAlarm
    , fmap (("Dimensions",) . toJSON) _cloudWatchAlarmDimensions
    , fmap (("EvaluateLowSampleCountPercentile",) . toJSON) _cloudWatchAlarmEvaluateLowSampleCountPercentile
    , (Just . ("EvaluationPeriods",) . toJSON . fmap Integer') _cloudWatchAlarmEvaluationPeriods
    , fmap (("ExtendedStatistic",) . toJSON) _cloudWatchAlarmExtendedStatistic
    , fmap (("InsufficientDataActions",) . toJSON) _cloudWatchAlarmInsufficientDataActions
    , fmap (("MetricName",) . toJSON) _cloudWatchAlarmMetricName
    , fmap (("Namespace",) . toJSON) _cloudWatchAlarmNamespace
    , fmap (("OKActions",) . toJSON) _cloudWatchAlarmOKActions
    , fmap (("Period",) . toJSON . fmap Integer') _cloudWatchAlarmPeriod
    , fmap (("Statistic",) . toJSON) _cloudWatchAlarmStatistic
    , (Just . ("Threshold",) . toJSON . fmap Double') _cloudWatchAlarmThreshold
    , fmap (("TreatMissingData",) . toJSON) _cloudWatchAlarmTreatMissingData
    , fmap (("Unit",) . toJSON) _cloudWatchAlarmUnit
    ]

instance FromJSON CloudWatchAlarm where
  parseJSON (Object obj) =
    CloudWatchAlarm <$>
      fmap (fmap (fmap unBool')) (obj .:? "ActionsEnabled") <*>
      (obj .:? "AlarmActions") <*>
      (obj .:? "AlarmDescription") <*>
      (obj .:? "AlarmName") <*>
      (obj .: "ComparisonOperator") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "DatapointsToAlarm") <*>
      (obj .:? "Dimensions") <*>
      (obj .:? "EvaluateLowSampleCountPercentile") <*>
      fmap (fmap unInteger') (obj .: "EvaluationPeriods") <*>
      (obj .:? "ExtendedStatistic") <*>
      (obj .:? "InsufficientDataActions") <*>
      (obj .:? "MetricName") <*>
      (obj .:? "Namespace") <*>
      (obj .:? "OKActions") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "Period") <*>
      (obj .:? "Statistic") <*>
      fmap (fmap unDouble') (obj .: "Threshold") <*>
      (obj .:? "TreatMissingData") <*>
      (obj .:? "Unit")
  parseJSON _ = mempty

-- | Constructor for 'CloudWatchAlarm' containing required fields as
-- arguments.
cloudWatchAlarm
  :: Val Text -- ^ 'cwaComparisonOperator'
  -> Val Integer -- ^ 'cwaEvaluationPeriods'
  -> Val Double -- ^ 'cwaThreshold'
  -> CloudWatchAlarm
cloudWatchAlarm comparisonOperatorarg evaluationPeriodsarg thresholdarg =
  CloudWatchAlarm
  { _cloudWatchAlarmActionsEnabled = Nothing
  , _cloudWatchAlarmAlarmActions = Nothing
  , _cloudWatchAlarmAlarmDescription = Nothing
  , _cloudWatchAlarmAlarmName = Nothing
  , _cloudWatchAlarmComparisonOperator = comparisonOperatorarg
  , _cloudWatchAlarmDatapointsToAlarm = Nothing
  , _cloudWatchAlarmDimensions = Nothing
  , _cloudWatchAlarmEvaluateLowSampleCountPercentile = Nothing
  , _cloudWatchAlarmEvaluationPeriods = evaluationPeriodsarg
  , _cloudWatchAlarmExtendedStatistic = Nothing
  , _cloudWatchAlarmInsufficientDataActions = Nothing
  , _cloudWatchAlarmMetricName = Nothing
  , _cloudWatchAlarmNamespace = Nothing
  , _cloudWatchAlarmOKActions = Nothing
  , _cloudWatchAlarmPeriod = Nothing
  , _cloudWatchAlarmStatistic = Nothing
  , _cloudWatchAlarmThreshold = thresholdarg
  , _cloudWatchAlarmTreatMissingData = Nothing
  , _cloudWatchAlarmUnit = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-actionsenabled
cwaActionsEnabled :: Lens' CloudWatchAlarm (Maybe (Val Bool))
cwaActionsEnabled = lens _cloudWatchAlarmActionsEnabled (\s a -> s { _cloudWatchAlarmActionsEnabled = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-alarmactions
cwaAlarmActions :: Lens' CloudWatchAlarm (Maybe (ValList Text))
cwaAlarmActions = lens _cloudWatchAlarmAlarmActions (\s a -> s { _cloudWatchAlarmAlarmActions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-alarmdescription
cwaAlarmDescription :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaAlarmDescription = lens _cloudWatchAlarmAlarmDescription (\s a -> s { _cloudWatchAlarmAlarmDescription = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-alarmname
cwaAlarmName :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaAlarmName = lens _cloudWatchAlarmAlarmName (\s a -> s { _cloudWatchAlarmAlarmName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-comparisonoperator
cwaComparisonOperator :: Lens' CloudWatchAlarm (Val Text)
cwaComparisonOperator = lens _cloudWatchAlarmComparisonOperator (\s a -> s { _cloudWatchAlarmComparisonOperator = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarm-datapointstoalarm
cwaDatapointsToAlarm :: Lens' CloudWatchAlarm (Maybe (Val Integer))
cwaDatapointsToAlarm = lens _cloudWatchAlarmDatapointsToAlarm (\s a -> s { _cloudWatchAlarmDatapointsToAlarm = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-dimension
cwaDimensions :: Lens' CloudWatchAlarm (Maybe [CloudWatchAlarmDimension])
cwaDimensions = lens _cloudWatchAlarmDimensions (\s a -> s { _cloudWatchAlarmDimensions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-evaluatelowsamplecountpercentile
cwaEvaluateLowSampleCountPercentile :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaEvaluateLowSampleCountPercentile = lens _cloudWatchAlarmEvaluateLowSampleCountPercentile (\s a -> s { _cloudWatchAlarmEvaluateLowSampleCountPercentile = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-evaluationperiods
cwaEvaluationPeriods :: Lens' CloudWatchAlarm (Val Integer)
cwaEvaluationPeriods = lens _cloudWatchAlarmEvaluationPeriods (\s a -> s { _cloudWatchAlarmEvaluationPeriods = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-extendedstatistic
cwaExtendedStatistic :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaExtendedStatistic = lens _cloudWatchAlarmExtendedStatistic (\s a -> s { _cloudWatchAlarmExtendedStatistic = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-insufficientdataactions
cwaInsufficientDataActions :: Lens' CloudWatchAlarm (Maybe (ValList Text))
cwaInsufficientDataActions = lens _cloudWatchAlarmInsufficientDataActions (\s a -> s { _cloudWatchAlarmInsufficientDataActions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-metricname
cwaMetricName :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaMetricName = lens _cloudWatchAlarmMetricName (\s a -> s { _cloudWatchAlarmMetricName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-namespace
cwaNamespace :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaNamespace = lens _cloudWatchAlarmNamespace (\s a -> s { _cloudWatchAlarmNamespace = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-okactions
cwaOKActions :: Lens' CloudWatchAlarm (Maybe (ValList Text))
cwaOKActions = lens _cloudWatchAlarmOKActions (\s a -> s { _cloudWatchAlarmOKActions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-period
cwaPeriod :: Lens' CloudWatchAlarm (Maybe (Val Integer))
cwaPeriod = lens _cloudWatchAlarmPeriod (\s a -> s { _cloudWatchAlarmPeriod = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-statistic
cwaStatistic :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaStatistic = lens _cloudWatchAlarmStatistic (\s a -> s { _cloudWatchAlarmStatistic = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-threshold
cwaThreshold :: Lens' CloudWatchAlarm (Val Double)
cwaThreshold = lens _cloudWatchAlarmThreshold (\s a -> s { _cloudWatchAlarmThreshold = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-treatmissingdata
cwaTreatMissingData :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaTreatMissingData = lens _cloudWatchAlarmTreatMissingData (\s a -> s { _cloudWatchAlarmTreatMissingData = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-unit
cwaUnit :: Lens' CloudWatchAlarm (Maybe (Val Text))
cwaUnit = lens _cloudWatchAlarmUnit (\s a -> s { _cloudWatchAlarmUnit = a })
