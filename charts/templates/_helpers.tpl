
{{- define "go-echoe3340216-4759-4494-be3f-7addab46112b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3340216-4759-4494-be3f-7addab46112b.fullname" -}}
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


{{- define "go-echoe3340216-4759-4494-be3f-7addab46112b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3340216-4759-4494-be3f-7addab46112b.labels" -}}
helm.sh/chart: {{ include "go-echoe3340216-4759-4494-be3f-7addab46112b.chart" . }}
{{ include "go-echoe3340216-4759-4494-be3f-7addab46112b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe3340216-4759-4494-be3f-7addab46112b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe3340216-4759-4494-be3f-7addab46112b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}