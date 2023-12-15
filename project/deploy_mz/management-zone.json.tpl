{
  "name": "$CLIENT Prod",
  "rules": [
    {
      "enabled": true,
      "type": "SELECTOR",
      "entitySelector": "type(\"QUEUE\"),toRelationships.indirectlySendsToQueue(type(\"SERVICE\"),entityName.startswith(\"[$CLIENT\"))"
    },
    {
      "enabled": true,
      "type": "SELECTOR",
      "entitySelector": "type(SERVICE),serviceType(DATABASE_SERVICE),toRelationships.calls(type(SERVICE),entityName.startswith(\"[$CLIENT\"))"
    },
    {
      "enabled": true,
      "type": "DIMENSION",
      "dimensionRule": {
        "appliesTo": "METRIC",
        "conditions": [
          {
            "conditionType": "DIMENSION",
            "key": "dt.entity.cloud_application_namespace",
            "ruleMatcher": "EQUALS",
            "value": "$CLIENT"
          },
          {
            "conditionType": "DIMENSION",
            "key": "k8s.cluster.name",
            "ruleMatcher": "EQUALS",
            "value": "okd-app-pro k8s"
          }
        ]
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "SERVICE",
        "conditions": [
          {
            "key": "SERVICE_DATABASE_NAME",
            "operator": "EQUALS",
            "stringValue": "$CLIENT",
            "caseSensitive": false
          }
        ],
        "serviceToHostPropagation": true,
        "serviceToPGPropagation": true
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "BROWSER_MONITOR",
        "conditions": [
          {
            "key": "BROWSER_MONITOR_NAME",
            "operator": "CONTAINS",
            "stringValue": "$CLIENT",
            "caseSensitive": false
          }
        ]
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "WEB_APPLICATION",
        "conditions": [
          {
            "key": "WEB_APPLICATION_NAME",
            "operator": "CONTAINS",
            "stringValue": "$CLIENT",
            "caseSensitive": false
          }
        ]
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "HOST",
        "conditions": [
          {
            "key": "KUBERNETES_CLUSTER_NAME",
            "operator": "EQUALS",
            "stringValue": "okd-app-pro k8s",
            "caseSensitive": true
          }
        ],
        "hostToPGPropagation": true
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "KUBERNETES_CLUSTER",
        "conditions": [
          {
            "key": "KUBERNETES_CLUSTER_NAME",
            "operator": "EQUALS",
            "stringValue": "okd-app-pro k8s",
            "caseSensitive": true
          }
        ]
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "CLOUD_APPLICATION_NAMESPACE",
        "conditions": [
          {
            "key": "CLOUD_APPLICATION_NAMESPACE_NAME",
            "operator": "EQUALS",
            "stringValue": "$CLIENT",
            "caseSensitive": true
          },
          {
            "key": "KUBERNETES_CLUSTER_NAME",
            "operator": "EQUALS",
            "stringValue": "okd-app-pro k8s",
            "caseSensitive": true
          }
        ]
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "KUBERNETES_SERVICE",
        "conditions": [
          {
            "key": "CLOUD_APPLICATION_NAMESPACE_NAME",
            "operator": "EQUALS",
            "stringValue": "$CLIENT",
            "caseSensitive": true
          },
          {
            "key": "KUBERNETES_CLUSTER_NAME",
            "operator": "EQUALS",
            "stringValue": "okd-app-pro k8s",
            "caseSensitive": true
          }
        ]
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "CLOUD_APPLICATION",
        "conditions": [
          {
            "key": "CLOUD_APPLICATION_NAMESPACE_NAME",
            "operator": "EQUALS",
            "stringValue": "$CLIENT",
            "caseSensitive": true
          },
          {
            "key": "KUBERNETES_CLUSTER_NAME",
            "operator": "EQUALS",
            "stringValue": "okd-app-pro k8s",
            "caseSensitive": true
          }
        ]
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "SERVICE",
        "conditions": [
          {
            "key": "SERVICE_DATABASE_HOST_NAME",
            "operator": "CONTAINS",
            "stringValue": "prod",
            "caseSensitive": true
          },
          {
            "key": "SERVICE_DATABASE_NAME",
            "operator": "CONTAINS",
            "stringValue": "$CLIENT",
            "caseSensitive": false
          }
        ],
        "serviceToHostPropagation": true,
        "serviceToPGPropagation": true
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "PROCESS_GROUP",
        "conditions": [
          {
            "key": "PROCESS_GROUP_NAME",
            "operator": "CONTAINS",
            "stringValue": "$CLIENT",
            "caseSensitive": false
          },
          {
            "key": "HOST_GROUP_ID",
            "operator": "EQUALS",
            "entityId": "{{ .extractedIDs.id_HOST_GROUP_5B72AFAE1CC7166D }}"
          }
        ],
        "pgToHostPropagation": true,
        "pgToServicePropagation": true
      }
    },
    {
      "enabled": true,
      "type": "ME",
      "attributeRule": {
        "entityType": "PROCESS_GROUP",
        "conditions": [
          {
            "key": "KUBERNETES_CLUSTER_NAME",
            "operator": "EQUALS",
            "stringValue": "okd-app-pro k8s",
            "caseSensitive": false
          },
          {
            "key": "CLOUD_APPLICATION_NAMESPACE_NAME",
            "operator": "EQUALS",
            "stringValue": "$CLIENT",
            "caseSensitive": false
          }
        ],
        "pgToHostPropagation": true,
        "pgToServicePropagation": true
      }
    }
  ]
}
