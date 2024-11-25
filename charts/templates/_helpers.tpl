
{{- define "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.fullname" -}}
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


{{- define "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.labels" -}}
helm.sh/chart: {{ include "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.chart" . }}
{{ include "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7cb42162-4312-4c62-a003-208c84e5e6ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}