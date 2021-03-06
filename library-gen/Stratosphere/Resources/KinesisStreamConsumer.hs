{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kinesis-streamconsumer.html

module Stratosphere.Resources.KinesisStreamConsumer where

import Stratosphere.ResourceImports


-- | Full data type definition for KinesisStreamConsumer. See
-- 'kinesisStreamConsumer' for a more convenient constructor.
data KinesisStreamConsumer =
  KinesisStreamConsumer
  { _kinesisStreamConsumerConsumerName :: Val Text
  , _kinesisStreamConsumerStreamARN :: Val Text
  } deriving (Show, Eq)

instance ToJSON KinesisStreamConsumer where
  toJSON KinesisStreamConsumer{..} =
    object $
    catMaybes
    [ (Just . ("ConsumerName",) . toJSON) _kinesisStreamConsumerConsumerName
    , (Just . ("StreamARN",) . toJSON) _kinesisStreamConsumerStreamARN
    ]

instance FromJSON KinesisStreamConsumer where
  parseJSON (Object obj) =
    KinesisStreamConsumer <$>
      (obj .: "ConsumerName") <*>
      (obj .: "StreamARN")
  parseJSON _ = mempty

-- | Constructor for 'KinesisStreamConsumer' containing required fields as
-- arguments.
kinesisStreamConsumer
  :: Val Text -- ^ 'kscConsumerName'
  -> Val Text -- ^ 'kscStreamARN'
  -> KinesisStreamConsumer
kinesisStreamConsumer consumerNamearg streamARNarg =
  KinesisStreamConsumer
  { _kinesisStreamConsumerConsumerName = consumerNamearg
  , _kinesisStreamConsumerStreamARN = streamARNarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kinesis-streamconsumer.html#cfn-kinesis-streamconsumer-consumername
kscConsumerName :: Lens' KinesisStreamConsumer (Val Text)
kscConsumerName = lens _kinesisStreamConsumerConsumerName (\s a -> s { _kinesisStreamConsumerConsumerName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kinesis-streamconsumer.html#cfn-kinesis-streamconsumer-streamarn
kscStreamARN :: Lens' KinesisStreamConsumer (Val Text)
kscStreamARN = lens _kinesisStreamConsumerStreamARN (\s a -> s { _kinesisStreamConsumerStreamARN = a })
