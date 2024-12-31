
{{- define "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.fullname" -}}
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


{{- define "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.labels" -}}
helm.sh/chart: {{ include "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.chart" . }}
{{ include "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0e1450d6-21c9-426c-8c26-eda5dd18e30f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}