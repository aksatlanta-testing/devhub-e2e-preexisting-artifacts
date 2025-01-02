
{{- define "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.fullname" -}}
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


{{- define "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.labels" -}}
helm.sh/chart: {{ include "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.chart" . }}
{{ include "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0bee99cf-b2f2-4a3e-b65e-49399cf24c72.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}