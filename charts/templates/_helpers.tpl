
{{- define "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.fullname" -}}
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


{{- define "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.labels" -}}
helm.sh/chart: {{ include "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.chart" . }}
{{ include "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoece68f9e-87e1-4acb-8c43-e3a0a1caa867.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}