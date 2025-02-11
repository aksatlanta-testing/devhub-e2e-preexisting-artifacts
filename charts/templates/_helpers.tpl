
{{- define "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.fullname" -}}
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


{{- define "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.labels" -}}
helm.sh/chart: {{ include "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.chart" . }}
{{ include "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo008bda6b-081b-4181-a8a0-eb18e9be4006.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}