
{{- define "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.fullname" -}}
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


{{- define "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.labels" -}}
helm.sh/chart: {{ include "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.chart" . }}
{{ include "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa7337b75-57e8-47e1-9104-17a3c38e0057.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}