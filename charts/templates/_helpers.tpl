
{{- define "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.fullname" -}}
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


{{- define "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.labels" -}}
helm.sh/chart: {{ include "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.chart" . }}
{{ include "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod8e3aa67-f77f-461d-b21c-9061b4eb3ccb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}