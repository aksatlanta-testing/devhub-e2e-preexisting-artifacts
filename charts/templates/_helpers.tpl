
{{- define "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.fullname" -}}
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


{{- define "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.labels" -}}
helm.sh/chart: {{ include "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.chart" . }}
{{ include "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d6b6a6b-a4c9-47ce-8df9-0e293781e3da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}