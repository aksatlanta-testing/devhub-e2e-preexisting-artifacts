
{{- define "go-echobd989f1e-09d9-44eb-98fb-db660776f532.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd989f1e-09d9-44eb-98fb-db660776f532.fullname" -}}
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


{{- define "go-echobd989f1e-09d9-44eb-98fb-db660776f532.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd989f1e-09d9-44eb-98fb-db660776f532.labels" -}}
helm.sh/chart: {{ include "go-echobd989f1e-09d9-44eb-98fb-db660776f532.chart" . }}
{{ include "go-echobd989f1e-09d9-44eb-98fb-db660776f532.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd989f1e-09d9-44eb-98fb-db660776f532.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd989f1e-09d9-44eb-98fb-db660776f532.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}