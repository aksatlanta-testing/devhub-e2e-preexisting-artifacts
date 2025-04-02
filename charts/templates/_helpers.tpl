
{{- define "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.fullname" -}}
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


{{- define "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.labels" -}}
helm.sh/chart: {{ include "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.chart" . }}
{{ include "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8ca6f453-afb1-488a-bc7a-35feaebaaadc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}