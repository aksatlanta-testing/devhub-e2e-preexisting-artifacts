
{{- define "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.fullname" -}}
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


{{- define "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.labels" -}}
helm.sh/chart: {{ include "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.chart" . }}
{{ include "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf5a84a1-af3a-4e9c-b760-9e6f62010950.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}