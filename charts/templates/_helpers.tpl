
{{- define "go-echof2407429-a4ad-418a-85d7-21016072b523.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2407429-a4ad-418a-85d7-21016072b523.fullname" -}}
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


{{- define "go-echof2407429-a4ad-418a-85d7-21016072b523.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2407429-a4ad-418a-85d7-21016072b523.labels" -}}
helm.sh/chart: {{ include "go-echof2407429-a4ad-418a-85d7-21016072b523.chart" . }}
{{ include "go-echof2407429-a4ad-418a-85d7-21016072b523.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2407429-a4ad-418a-85d7-21016072b523.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2407429-a4ad-418a-85d7-21016072b523.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}