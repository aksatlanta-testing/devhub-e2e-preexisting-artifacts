
{{- define "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.fullname" -}}
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


{{- define "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.labels" -}}
helm.sh/chart: {{ include "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.chart" . }}
{{ include "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d2565b1-858e-4c21-b3e6-68c80eb61ada.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}