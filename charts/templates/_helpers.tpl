
{{- define "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.fullname" -}}
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


{{- define "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.labels" -}}
helm.sh/chart: {{ include "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.chart" . }}
{{ include "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo79750da3-6cc1-4b2f-a49e-87b2d201d36e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}