{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html

module Stratosphere.Resources.DynamoDBTable where

import Control.Lens
import Data.Aeson
import Data.Aeson.Types
import Data.Text
import GHC.Generics

import Stratosphere.Values
import Stratosphere.ResourceProperties.DynamoDBTableAttributeDefinition
import Stratosphere.ResourceProperties.DynamoDBTableGlobalSecondaryIndex
import Stratosphere.ResourceProperties.DynamoDBTableKeySchema
import Stratosphere.ResourceProperties.DynamoDBTableLocalSecondaryIndex
import Stratosphere.ResourceProperties.DynamoDBTableProvisionedThroughput
import Stratosphere.ResourceProperties.DynamoDBTableStreamSpecification

-- | Full data type definition for DynamoDBTable. See 'dynamoDBTable' for a
-- | more convenient constructor.
data DynamoDBTable =
  DynamoDBTable
  { _dynamoDBTableAttributeDefinitions :: [DynamoDBTableAttributeDefinition]
  , _dynamoDBTableGlobalSecondaryIndexes :: Maybe [DynamoDBTableGlobalSecondaryIndex]
  , _dynamoDBTableKeySchema :: [DynamoDBTableKeySchema]
  , _dynamoDBTableLocalSecondaryIndexes :: Maybe [DynamoDBTableLocalSecondaryIndex]
  , _dynamoDBTableProvisionedThroughput :: DynamoDBTableProvisionedThroughput
  , _dynamoDBTableStreamSpecification :: Maybe DynamoDBTableStreamSpecification
  , _dynamoDBTableTableName :: Maybe (Val Text)
  } deriving (Show, Generic)

instance ToJSON DynamoDBTable where
  toJSON = genericToJSON defaultOptions { fieldLabelModifier = Prelude.drop 14, omitNothingFields = True }

instance FromJSON DynamoDBTable where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = Prelude.drop 14, omitNothingFields = True }

-- | Constructor for 'DynamoDBTable' containing required fields as arguments.
dynamoDBTable
  :: [DynamoDBTableAttributeDefinition] -- ^ 'ddbtAttributeDefinitions'
  -> [DynamoDBTableKeySchema] -- ^ 'ddbtKeySchema'
  -> DynamoDBTableProvisionedThroughput -- ^ 'ddbtProvisionedThroughput'
  -> DynamoDBTable
dynamoDBTable attributeDefinitionsarg keySchemaarg provisionedThroughputarg =
  DynamoDBTable
  { _dynamoDBTableAttributeDefinitions = attributeDefinitionsarg
  , _dynamoDBTableGlobalSecondaryIndexes = Nothing
  , _dynamoDBTableKeySchema = keySchemaarg
  , _dynamoDBTableLocalSecondaryIndexes = Nothing
  , _dynamoDBTableProvisionedThroughput = provisionedThroughputarg
  , _dynamoDBTableStreamSpecification = Nothing
  , _dynamoDBTableTableName = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html#cfn-dynamodb-table-attributedef
ddbtAttributeDefinitions :: Lens' DynamoDBTable [DynamoDBTableAttributeDefinition]
ddbtAttributeDefinitions = lens _dynamoDBTableAttributeDefinitions (\s a -> s { _dynamoDBTableAttributeDefinitions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html#cfn-dynamodb-table-gsi
ddbtGlobalSecondaryIndexes :: Lens' DynamoDBTable (Maybe [DynamoDBTableGlobalSecondaryIndex])
ddbtGlobalSecondaryIndexes = lens _dynamoDBTableGlobalSecondaryIndexes (\s a -> s { _dynamoDBTableGlobalSecondaryIndexes = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html#cfn-dynamodb-table-keyschema
ddbtKeySchema :: Lens' DynamoDBTable [DynamoDBTableKeySchema]
ddbtKeySchema = lens _dynamoDBTableKeySchema (\s a -> s { _dynamoDBTableKeySchema = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html#cfn-dynamodb-table-lsi
ddbtLocalSecondaryIndexes :: Lens' DynamoDBTable (Maybe [DynamoDBTableLocalSecondaryIndex])
ddbtLocalSecondaryIndexes = lens _dynamoDBTableLocalSecondaryIndexes (\s a -> s { _dynamoDBTableLocalSecondaryIndexes = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html#cfn-dynamodb-table-provisionedthroughput
ddbtProvisionedThroughput :: Lens' DynamoDBTable DynamoDBTableProvisionedThroughput
ddbtProvisionedThroughput = lens _dynamoDBTableProvisionedThroughput (\s a -> s { _dynamoDBTableProvisionedThroughput = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html#cfn-dynamodb-table-streamspecification
ddbtStreamSpecification :: Lens' DynamoDBTable (Maybe DynamoDBTableStreamSpecification)
ddbtStreamSpecification = lens _dynamoDBTableStreamSpecification (\s a -> s { _dynamoDBTableStreamSpecification = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-dynamodb-table.html#cfn-dynamodb-table-tablename
ddbtTableName :: Lens' DynamoDBTable (Maybe (Val Text))
ddbtTableName = lens _dynamoDBTableTableName (\s a -> s { _dynamoDBTableTableName = a })
