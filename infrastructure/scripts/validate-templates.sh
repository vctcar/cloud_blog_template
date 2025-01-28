#!/bin/bash
for template in infrastructure/cloudformation/*.yml; do
    echo "Validating $template..."
    aws cloudformation validate-template --template-body file://$template
done
