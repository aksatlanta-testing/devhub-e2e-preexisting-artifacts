
{{- define "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.fullname" -}}
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


{{- define "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.labels" -}}
helm.sh/chart: {{ include "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.chart" . }}
{{ include "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f890d9d-0c11-49d8-9f0d-a8a799245e0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}