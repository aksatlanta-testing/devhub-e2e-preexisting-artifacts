
{{- define "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.fullname" -}}
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


{{- define "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.labels" -}}
helm.sh/chart: {{ include "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.chart" . }}
{{ include "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf687adf-2c37-42cc-90b2-d89d2a34d722.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}