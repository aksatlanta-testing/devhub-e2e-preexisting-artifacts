
{{- define "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.fullname" -}}
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


{{- define "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.labels" -}}
helm.sh/chart: {{ include "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.chart" . }}
{{ include "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo80664aa5-6aa6-4a0e-9c67-e77b0cae73dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}