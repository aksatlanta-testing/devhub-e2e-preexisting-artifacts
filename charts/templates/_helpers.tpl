
{{- define "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.fullname" -}}
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


{{- define "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.labels" -}}
helm.sh/chart: {{ include "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.chart" . }}
{{ include "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01607f83-d416-4f14-a998-943a8e73fd6d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}