
{{- define "go-echo855cec18-8744-426c-888a-fee0e2c1a105.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo855cec18-8744-426c-888a-fee0e2c1a105.fullname" -}}
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


{{- define "go-echo855cec18-8744-426c-888a-fee0e2c1a105.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo855cec18-8744-426c-888a-fee0e2c1a105.labels" -}}
helm.sh/chart: {{ include "go-echo855cec18-8744-426c-888a-fee0e2c1a105.chart" . }}
{{ include "go-echo855cec18-8744-426c-888a-fee0e2c1a105.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo855cec18-8744-426c-888a-fee0e2c1a105.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo855cec18-8744-426c-888a-fee0e2c1a105.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}