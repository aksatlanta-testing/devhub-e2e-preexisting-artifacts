
{{- define "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.fullname" -}}
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


{{- define "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.labels" -}}
helm.sh/chart: {{ include "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.chart" . }}
{{ include "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo301a7fe7-bf69-42c7-a47f-1eedc6336cbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}