
{{- define "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.fullname" -}}
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


{{- define "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.labels" -}}
helm.sh/chart: {{ include "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.chart" . }}
{{ include "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d41b2aa-5b9e-4fac-895a-4a45918380ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}