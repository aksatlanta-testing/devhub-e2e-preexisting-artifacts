
{{- define "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.labels" -}}
helm.sh/chart: {{ include "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.chart" . }}
{{ include "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd1c28d8-7f89-40b6-b43e-92fd80b8326d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}