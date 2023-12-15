- id: $CLIENT
  config:
    name:
        name: $CLIENT Prod
    parameters:
      client:
#        type: environment
        name: $CLIENT
    template: template_mz.json
    skip: false
  type:
    settings:
      schema: builtin:management-zones
      scope: environment
