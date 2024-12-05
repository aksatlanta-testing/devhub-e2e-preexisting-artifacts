
{{- define "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.fullname" -}}
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


{{- define "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.labels" -}}
helm.sh/chart: {{ include "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.chart" . }}
{{ include "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo303c0bac-ca0f-4209-a56e-c296c0cec11a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}